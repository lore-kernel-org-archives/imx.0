Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454888;
	b=pQZbXH5aoxPKKBVAV873u94aqYUpgBMLMwNR4JPMdGGY0jFf9RirX2jMBjLzu36egFdh
	 Ggxuml7XxOZyc4Ohr6NFn/clbqsSFCO9N2Cz//YhjkP9ogen0HhtlHJeFXpYFp0U4nBhc
	 UobsRcCZOSD8Nx/yC3eqVMjAWbFsFR8g7TlgFh587FySLPH5esorUWHhWyp2JIGblA1su
	 OoBIghyK+d5TZ2H9tOIZP/8iA1hR76LHHOkQf+NrycIr6wL272gocctYflGkZIezsw+I1
	 hsteQXMkLefE/GKKspF6ZoljnVgihqiieqQKAHpIiwOC8uS10WHu0coMV+udbIGPMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454888;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yuLq/CVkn01COKhtaRNHf/SNole7NC0lI8dGY7Uzhd0=;
	b=Dsah8KIPcIPX/ge5meWyUl+bFAvwQ6a6r05CUOAdBvloV3osBfeAMg5uzZyoxNsnxgvX
	 vb2yVbIYdOTXO+Tf+9WMH5TAEU+1QL3ttGj4U4CsOul+c4xIh4HVl52PFoGbT7zHIc2jL
	 nl7UPwwLjyTaj2BL2VPricx3XkiiFfWV27xHB/MkEDx+fWH0L3GTZGT8cI5eiH7vpLenN
	 Nj8S0vWGJtP+zzWi+OXHseHIZ5GAEnCnGW5faaQaja8i778CEg7o6mQN2lgBUNlBs+cyf
	 McBRI90MjvjWZmu2DX/3Qev/H1EGAATNwWcWYx/wILszQZXJNnsJCRVPpqMwlUV/2Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khwDD58w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB2C606A31A
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khwDD58w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C88F1F000CF;
	Mon, 23 Nov 2026 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454887;
	bh=yuLq/CVkn01COKhtaRNHf/SNole7NC0lI8dGY7Uzhd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khwDD58w7tLmRiMnK2coDzl6edieNM+PzSnZ4iMISlVCXklkaAuxcg7dqtmKOzDsI
	 q6XOZa7/PLiI0mOKp0MFpkeljpZMXcFUhICBZpKAv51IKJfLgfwJ21p3d1Za9fwo/3
	 nazABknhBmidc1VmTDJ+s/b5CZHkljKezCGeSRoeFOd0U1a3W+aJLvjnn06Jzo7Ul/
	 OrR/CHRphBVSwDOGoFH28YgAxaRKkAR8r0agKKj0J7+c69JDjWeLWW9isvQu7Nenws
	 Yr+EvfHrVv2RUEUZXMWykQ6khzUmhqORyQ4NG57fBZl9PAdNMR3Ph3EFqm3/SF4J2K
	 c6T6hiuL6krng==
Message-ID: <sashiko-outbox-229745@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yige Jiang" <yigejiang86@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <confirmed-20261105-18-6a8421e1b241@gmail.com>
References: <confirmed-20261105-18-6a8421e1b241@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:28:07 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] pmdomain: imx: gpcv2: use-after-free in imx_gpcv2_probe()
  [1]
--

commit c3636a65fc3cbb73598f1158474f8ad80341a10d
Author: Yige Jiang <yigejiang86@gmail.com>

pmdomain: imx: gpcv2: Take a reference to each PGC node

This commit replaces device_set_node() with platform_device_set_of_node() in
imx_gpcv2_probe() so each child platform device holds its own reference to =
the
device tree node.

> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6a54ee7345146..7b377bf019649 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *=
pdev)
>  		domain->genpd.power_off =3D imx_pgc_power_down;
> =20
>  		pd_pdev->dev.parent =3D dev;
> -		device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
> +		platform_device_set_of_node(pd_pdev, np);
> =20
>  		ret =3D platform_device_add(pd_pdev);
>  		if (ret) {

[Severity: Critical]
This problem wasn't introduced by this patch, but can returning an error fr=
om
this loop [1] leave earlier child pd_pdev devices registered with a
dangling domain->regmap pointer?

When platform_device_add() or platform_device_add_data() fails on a later
child node, imx_gpcv2_probe() returns without unregistering the child platf=
orm
devices added in previous iterations.  The failure of imx_gpcv2_probe() then
releases the parent device's devm-managed regmap and MMIO mapping, so any
later power domain operation on the remaining child devices will cause a
use-after-free on domain->regmap.

[1] https://sashiko.dev/#/bug/linux-e1374cb3-5de8-4163-b459-98d74ba7a1e1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/confirmed-20261105-=
18-6a8421e1b241@gmail.com?part=3D1
