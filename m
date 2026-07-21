Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B92436353;
	Tue, 21 Jul 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625962; cv=none; b=c9HVV0000Wf/TsEH7hwEVkP5mYq52oxLfoB/4AunhcKtxgZ3LSKiuMpbTnA/IhmeX0N2hJNI0xjx3dB216yXkq9/uKaFSN9q8hSiZMj12/KKzCvFE1tucqOC3+PYzOBlYRLrJJtP/ebSp5s5IxaEdcku7Zti3fTGF14kOcTKUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625962; c=relaxed/simple;
	bh=UfDr4vw3X5z1eC5hOYLT1LyqrZEKytOufyurm9n/Qww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sDf1Dmd/gfUnVJg6AnLKo4CrwGZX6goubVOsDADilbsijk6lHojM82+W/7xxH0Gw6plMs9KiN5xuF9NT0IB3GWk30A8TBuG3+YBJxh5XxeJLlmHEaL7x6QJrzJD3EwPbxmwTIxlq33dRmRQ8yJl9dI3yAMrwk+5pLAfUyvVHIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ncr6e4Ie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ncr6e4Ie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1710C1F00A3E;
	Tue, 21 Jul 2026 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625961;
	bh=UfDr4vw3X5z1eC5hOYLT1LyqrZEKytOufyurm9n/Qww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ncr6e4IecF3Oz5xMLMdap26kh2GdhUQWMHhgHauV7ZqVAZXcap/fM9Co38IDIc/7I
	 40UfUWej3I7UCNUhQ+pOgz82KSsDnKftY/GIqi7hL9bDU9KQPaaRY+R1ZAuUMu/m1O
	 ar1/c9j0kIfjIWGeceLUHbj4xrG1URVzGvVjQC9zNxJNKkgje217nx1VhQ2Ju9/8Bb
	 I+zIILmJbBi6LHuN1hzR/4Wx+ZqFye55dBry9kqFcKNxum3NSKPxr9oOlWfYL0LPk0
	 UjcXu7ZRziSde1Aliy6KIytKlHDJXsT/A1KMeZZQ8uVC2UzGuI/7gcJqUqRvhEK5hB
	 YqPFqGOlmcbKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: lee@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:00 +0000
Message-Id: <20260721092601.1710C1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D3

