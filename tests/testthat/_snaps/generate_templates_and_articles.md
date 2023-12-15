# yaml emissions

    Code
      show(yaml_path("emissions"))
    Output
      ---
      title: "`r params$workflow`"
      output: github_document
      params:
        chunks: 3
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
        workflow: "profile_emissions.Rmd"
        emissions_profile_any_companies: "emissions_profile_any_companies.csv"
        emissions_profile_products: "emissions_profile_products.csv"
      ---

# yaml emissions_upstream

    Code
      show(yaml_path("emissions_upstream"))
    Output
      ---
      title: "`r params$workflow`"
      output: github_document
      params:
        chunks: 3
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
        workflow: "profile_emissions_upstream.Rmd"
        emissions_profile_any_companies: "emissions_profile_any_companies.csv"
        emissions_profile_upstream_products: "emissions_profile_upstream_products.csv"
        ecoinvent_inputs: "ecoinvent_inputs.csv"
      ---

# yaml sector

    Code
      show(yaml_path("sector"))
    Output
      ---
      title: "`r params$workflow`"
      output: github_document
      params:
        chunks: 3
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
        workflow: "sector_profile.Rmd"
        sector_profile_companies: "sector_profile_companies.csv"
        sector_profile_any_scenarios: "sector_profile_any_scenarios.csv"
      ---

# yaml sector_upstream

    Code
      show(yaml_path("sector_upstream"))
    Output
      ---
      title: "`r params$workflow`"
      output: github_document
      params:
        chunks: 3
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
        workflow: "sector_profile_upstream.Rmd"
        sector_profile_upstream_companies: "sector_profile_upstream_companies.csv"
        sector_profile_any_scenarios: "sector_profile_any_scenarios.csv"
        sector_profile_upstream_products: "sector_profile_upstream_products.csv"
        ecoinvent_inputs: "ecoinvent_inputs.csv"
      ---

