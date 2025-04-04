# generate-fleetworkspace.k

users = option("items") or []

fleet_workspaces = [
    {
        "apiVersion": "management.cattle.io/v3",
        "kind": "FleetWorkspace",
        "metadata": {
            "name": "{}-workspace".format(user["metadata"]["name"]),
            "annotations": {
                "field.cattle.io/creatorId": user["metadata"]["name"]
            }
        },
        "spec": {}
    }
    for user in users if user["kind"] == "User"
]

fleet_workspaces