import yaml

def generate_yaml(count):
    vms = []
    for i in range(1, count + 1):
        vm = {
            'name': f"vm{i}",
            'location': "West Europe" if i % 2 != 0 else "canadacentral",
            'size': "Standard_DS1_v2" if i % 2 != 0 else "Standard_DS2_v2",
            'tags': {
                'environment': "staging" if i % 2 != 0 else "production"
            }
        }
        vms.append(vm)
    
    config = {'virtual_machines': vms}
    with open('vms_config.yaml', 'w') as file:
        yaml.dump(config, file)

# Replace 10 with the number of VMs you want to create
generate_yaml(10)
