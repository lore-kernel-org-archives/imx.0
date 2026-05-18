Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1E395D87
	for <imx@lists.linux.dev>; Mon, 18 May 2026 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140289; cv=none; b=tsIzmgUT1EivxeiUjh2brlf1UB3EWnJ1oJxe1LV5zEGFja2rO7+eNtHJV114YvbgVEimR/5mDqEkdcp8JColjHFk7JKrStQo4uh4PERdmG/wtAVn0akeaPU+hCIQt1SqyV+AyKIFLJowlCtX7+DgGubt6EmP94G9xR0XnDEMtGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140289; c=relaxed/simple;
	bh=WxYUQWQDuXY7F2LdFF8xfEtMhKLtMIoX57o5ihqVGro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uwoOJ1FEcdwCvgg+iWoUriDscqkBUv/8GfBicg4u4cS1wzUJAUmWDF+DYZgMlW1iM5VOEoMiGmuPOQeAWHVe95lYW8mCwvrnSL/ZDgt3yTQrLumglKK43n82vpPPF2/VQcL/A8lnNAYAokREAdj3DrnGGkf2oTZmyo556jPxOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOOXLkQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOOXLkQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23571C2BCB7;
	Mon, 18 May 2026 21:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779140289;
	bh=WxYUQWQDuXY7F2LdFF8xfEtMhKLtMIoX57o5ihqVGro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iOOXLkQmza8nsFCGHrvYO4fk6o0MQgwtWefd26O976/JMusJoGBpK29YOcgJfkgd/
	 fHbi69mStT3prRWTBXIdpJtNzyowSM1p9sRKqgugBrDvzTikB3+qJDlGh0RauWMWtR
	 YFNR8SSKKY06lDUCctD85Q+SoiSWS1P9tZFJTbpV0YgMwQ+XGLb6eMYEiBgcjncLxA
	 n2VxxhxWYHiwcLjmmxMXZj+6/lIyNhWQgjDbn8a61xI6jJETO0ioQNmU+35vNIhXO0
	 FwjbmfW/pCPtQvciH1wPQSk+rC5e1tpVzT/xz1pryOK7hEGH0pRd+BYMY81lXyBQuS
	 Uh5D8B3hfp2VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] fbdev: imxfb: Use of_device_get_match_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518211303.10777-1-rosenp@gmail.com>
References: <20260518211303.10777-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 21:38:08 +0000
Message-Id: <20260518213809.23571C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch introduces a NULL pointer dereference for non-Device Tre=
e probes by unconditionally assigning the result of `of_device_get_match_da=
ta()` to `pdev->id_entry`.
- [High] This problem wasn't introduced by this patch, but there is a Use-A=
fter-Free vulnerability during driver removal due to mismatched manual and =
`devm`-managed cleanups.
--

commit bacef9a3e606a55e0a0cb62b81ba7008a6e42804
Author: Rosen Penev <rosenp@gmail.com>

fbdev: imxfb: Use of_device_get_match_data()

This commit simplifies the driver by replacing an open-coded of_match_devic=
e()
lookup with a direct call to of_device_get_match_data() and drops an unused
include.

> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index a077bf346bdf4..7a021da0a32a2 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
[ ... ]
> @@ -891,9 +889,7 @@ static int imxfb_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
> =20
> -	of_id =3D of_match_device(imxfb_of_dev_id, &pdev->dev);
> -	if (of_id)
> -		pdev->id_entry =3D of_id->data;
> +	pdev->id_entry =3D of_device_get_match_data(&pdev->dev);

For devices matched via the legacy platform bus, of_device_get_match_data()
returns NULL.

This unconditionally overwrites the previously valid pdev->id_entry with NU=
LL.

When imxfb_probe() subsequently calls imxfb_init_fbinfo(), does this cause a
NULL pointer dereference on pdev->id_entry?

drivers/video/fbdev/imxfb.c:imxfb_init_fbinfo() {
    ...
	fbi->pdev =3D pdev;
	fbi->devtype =3D pdev->id_entry->driver_data;
    ...
}

This problem wasn't introduced by this patch, but the driver registers the =
LCD
device using devm_lcd_device_register(), and explicitly frees the backing
memory structure fbi during imxfb_remove() and in probe error paths:

drivers/video/fbdev/imxfb.c:imxfb_remove() {
    ...
	framebuffer_release(info);
}

Because devm cleanup runs only after the remove function returns, the LCD
device and its sysfs attributes remain active while pointing to freed memor=
y.

If a userspace process accesses a sysfs attribute during this window, can it
trigger a use-after-free regression on the fbi structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518211303.1077=
7-1-rosenp@gmail.com?part=3D1
