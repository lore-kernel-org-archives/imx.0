Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44A157A5A
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885597; cv=none; b=U3WmT9xQPYA882Hz/qSmnbUY0s+oV7ZaJ5cRfa+5A4s3EucOSLaNZ/J0ZqyZuqZhRRlomGdUj06axs+zdHJ9Z3xzxgX92c+u0emDJQC3J68M1xs6RRDflHm5f4PX1nBd02egN2lToeKDVIjOcVVfmJZILPW9T9Ac84wcJfJ/EsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885597; c=relaxed/simple;
	bh=5YZu0ozIsXdt5YN1fN4LUb/CqqLL1K6e0ESYREAXCkc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hzn7XmV5XAD1JmIyOL1eGOc2PeONFppQQl24WJrCy1Ize9akZzKq1vHtiRgi8oO/tkfKgCL7wJbt1u58KOdt27Tqlnf26N8LAknIcdXTu1W9kWw9bk44XEguWRc4mi2IaukQHCvydT7anMgCPskrBkU9nRqY1xXL8Y5WwZisgSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyVUs5RP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyVUs5RP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19041F000FF;
	Tue, 13 Oct 2026 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885595;
	bh=N4CugEqYG5kca+dJgzriuqGrDAhbcqbI/VMgOVhaZJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyVUs5RPj7NmwEFzPWo3/jnrCeNoYb+idYR06zkp5PAKgvWLBPLhA54YPGU/P7fLU
	 lKuI0skoEu1O2Snj3SrLD3aT9x2PV/M6eDjHWzmA+2kdRemN6QUI6/jO+QYRZ/mO7/
	 ZLAfaWz/Apd/aiYblKTgNkoiLn1OeB/U9Y87ZSlyIrJQBM0aAFyrIar9Vj7WDNPOHv
	 WeMlBfepD+Oa89iKuynPM5DMlyNfD1bpQiI21cQELHZvfniyOsrvw3pQXe7R22P6SR
	 6UhpDUcC+QkoKel09uMZ3MqxvL1yb3tPp5LQ2Nl5JkuluXwXePV+V8SCRG9i3mxw9I
	 frc8yYXIEtK/w==
Message-ID: <sashiko-outbox-169415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 4/9] net: dsa: netc: tie setup resources and
 reset to DSA setup/teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261012095924.1129312-5-wei.fang@oss.nxp.com>
References: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
 <20261012095924.1129312-5-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:59:55 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dsa: AB-BA deadlock between dsa2_mutex and pci device_lock during =
switch setup/teardown
- [High] netc: race condition in netc_switch_reset() leading to unheld PCI =
device lock
--

commit f362c9d18af3d66bf5d5401a43abc544295b1901
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: tie setup resources and reset to DSA setup/teardown

This commit modifies the NETC switch driver to explicitly allocate and free
resources during DSA setup and teardown, instead of relying on devm allocat=
ions
during PCI probe. It also adds a PCI reset into netc_setup() to ensure a
clean hardware state when starting up.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> +static int netc_switch_reset(struct netc_switch *priv)
> +{
> +	if (priv->in_probe)
> +		return pci_reset_function_locked(priv->pdev);

[Severity: High]
Can a concurrent thread execute this path without holding the PCI device
lock?

In a multi-switch DSA tree, priv->in_probe is set to true during
netc_switch_probe(). The thread then calls dsa_register_switch(), which
internally acquires and releases dsa2_mutex. If the DSA tree is incomplete,
it returns, and the thread can be preempted before executing
priv->in_probe =3D false.

Concurrently, a second thread could probe the second switch, complete the
tree, acquire dsa2_mutex, and call dsa_tree_setup_switches(). This invokes
netc_setup() for the first switch. Observing priv->in_probe =3D=3D true, the
second thread would call pci_reset_function_locked() on the first switch's
PCI device, despite not holding its device lock.

> +
> +	return pci_reset_function(priv->pdev);

[Severity: High]
Does this introduce an AB-BA deadlock between the PCI device lock and
dsa2_mutex?

When a multi-switch DSA tree is set up, netc_setup() can be called for an
already-probed switch. In this case, priv->in_probe is false, and
netc_switch_reset() calls pci_reset_function(), which acquires the PCI
device lock. However, netc_setup() is invoked by the DSA core with the
global dsa2_mutex held.

Conversely, when a switch is unbound (e.g. via sysfs), the driver core first
acquires the switch's device lock and then calls the driver's remove
callback. The netc_switch_remove() function calls dsa_unregister_switch(),
which attempts to acquire dsa2_mutex:

net/dsa/dsa.c:dsa_unregister_switch() {
    ...
    mutex_lock(&dsa2_mutex);
    dsa_switch_remove(ds);
    mutex_unlock(&dsa2_mutex);
    ...
}

If Thread 1 is unbinding Switch A (holding the device lock for A and waiting
for dsa2_mutex) while Thread 2 is probing Switch B (holding dsa2_mutex and
calling pci_reset_function(A) inside netc_setup(A)), the system could
deadlock.

> +}

[ ... ]

> @@ -2475,12 +2565,15 @@ static int netc_switch_probe(struct pci_dev *pdev,
>  	ds->ageing_time_max =3D U32_MAX;
>  	ds->priv =3D priv;
>  	priv->ds =3D ds;
> +	priv->in_probe =3D true;
> =20
>  	err =3D dsa_register_switch(ds);
>  	if (err)
>  		return dev_err_probe(dev, err,
>  				     "Failed to register DSA switch\n");
> =20
> +	priv->in_probe =3D false;
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095924.1129=
312-1-wei.fang@oss.nxp.com?part=3D4
