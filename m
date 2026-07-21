Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3430566C;
	Tue, 21 Jul 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625961; cv=none; b=hlwnQuPK/z4njlXYsZ6Zj1yjAOCsDSKRJzrrgPjOcYXcZ+rZhm5J2wd9paw6owP1nRYw8N/0vDgaSqM56Z+yIgrLeHLOy3gFpUFESCEfTuTbmYLk29LL6rTPDV3xSSy8rrfQl8q77MTIbHUq5/h7fvSTWZzvr0UF1krFHCBbn6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625961; c=relaxed/simple;
	bh=mXRBA+TNJg+tyUHhvvwzCYyNZqMotkShnxyMOPwTxrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DBZXwCHQLyV6z6fFwVavFfWnJagyaQk+a3I0PvdXHRsheONKvfuXUXcVXFrZaGK52w3lUfTmDhKP0znSq8aUhg0ssi/aM/0beby9ucZcaUwev4RCnEmjmBiQGUEBxFDGeYFKUvao40jDGA3Pi2UeUrKtzmpAgZzqmeamKne3hJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iijynhYS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iijynhYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D931F00A3A;
	Tue, 21 Jul 2026 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625960;
	bh=mXRBA+TNJg+tyUHhvvwzCYyNZqMotkShnxyMOPwTxrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iijynhYS84OONlN5y6yEZxRctfIcTMlZCPi2zaDVkckgsA0SOkdd4xbiBbjFptgzV
	 ixWbtVW2JWacn8b3g6+ekELb6nt3Gfvv3UaUt2/iSLWaWOUCnlkaluy9avBw/7k1oR
	 u2nhr/99qKRV1hY8+/WvFpgon1jyFDf5ckRerqAEiRnAxnV3HCAG+tklKZDkyIYoqn
	 u6P3lJCvMDgXvrZwXwlCKt5Y4XsI4tkDJybmpsFSbsLp7zTe21eG8kvqP0sRUr+E5m
	 2nj/nwkUrJdkykrE41kcXbvsC00g8W2ct6Z2BSIZ+KI9MhfKWq001nNp68kTABKAdI
	 iveUuqMOiiALA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] powerpc/powermac: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: lee@kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev, imx@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-1-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-1-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:25:59 +0000
Message-Id: <20260721092559.E2D931F00A3A@smtp.kernel.org>
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
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D1

