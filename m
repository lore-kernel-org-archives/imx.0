Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AB3DB658
	for <imx@lists.linux.dev>; Mon, 25 May 2026 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696544; cv=none; b=pyArgCXKFr7iR6ibvKQ+OD8iyrTUyOYZIkxcufV+5rOyLSPg8AM6L9cSET9Sx4ADW3LaNMNp2F2wTVO6kxDSBDH284sEkOt2ICTjHUZWgOH9H/f6GoPFkA0wbsE6QMG6nR+MEBiLR0dykasVLIB2f+pQISDXW1m1kctcVnyAyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696544; c=relaxed/simple;
	bh=cjpDxlGjxbrteJ6DcyViB/YzfT8ZnJ/XWjvvotMQRp8=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ti3w8lVKH7lw9BJDM/fShd4UO4BssJWBu4jR/vtnJYi+eWwiNiKO9OXY4rrO0lTCqqEb9uXgtXN4xpBu60rzot1+JnAVgrgvT0kLFR1RB1l0zvLNLotSwp03niKiha0G9zrbYqW44iDqvUe8XQAwoxdesgLSgESRtD+B3/8Nr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFaGLGY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFaGLGY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFE01F000E9;
	Mon, 25 May 2026 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696542;
	bh=7U5v2ZzpwhwSxfVWi0A/AWF8oaMxtbmwduuRx63KOUI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=hFaGLGY4Micsw4Phx/yQfRaKj3DB/5/oorpq6pLct8/gLXnR4RqOENy39UL51R67s
	 APm8CzKfjQjs2I9SToDWLxJYsbgBFLUZRuZclcvtD8A9hjmqzM4gNYfex33CKCTyRJ
	 BGpI61o/XereNclTEROZ9IG26ZbzYnWMd+njYpnetjPFJW02irOs+6AL3lYa9vIU1O
	 rFNd7yFM380qQddfwYBqdu/BD4Gdg4HJ0xRVzSpapMg93p1F1c46o6KQJUBXp9yT4b
	 rlpE2JhmGav43/D7+eJiHPTkydtvO5K8w3+UkB7CVcnVRE0NYcYuzkbXFhhR8kl9zP
	 QhffmHuKOSl7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] firmware: imx: ele: simplify SoC device
 registration
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:09:01 +0000
Message-Id: <20260525080902.3AFE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and resource leak due to missing soc_device_unregis=
ter().
- [High] Information leak and functional breakage in get_se_soc_id() due to=
 incorrect struct casting.
--

commit e7ad33f52996b1ca324a005406dedb896f547398
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: simplify SoC device registration

This patch simplifies the SoC device registration for i.MX by replacing
the boolean 'soc_register' flag with a 'soc_name' string. The presence
of 'soc_name' now dictates registration, removing the need for a switch
statement.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -56,7 +56,7 @@ struct se_var_info {
>  /* contains fixed information */
>  struct se_soc_info {
>  	const u16 soc_id;
> -	const bool soc_register;
> +	const char *soc_name;
>  	const struct se_fw_img_name se_fw_img_nm;
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does get_se_soc_id()
incorrectly cast the match data and leak kernel address information?

device_get_match_data() returns a pointer to struct se_if_node, but
get_se_soc_id() assigns it to a const struct se_soc_info * pointer.

Since the first member of struct se_if_node is a pointer (se_info)
rather than a u16 soc_id, will accessing se_info->soc_id read the lower
16 bits of the kernel pointer instead of the actual SoC ID?

[ ... ]
> @@ -181,14 +181,7 @@ static int get_se_soc_info(struct se_if_priv *priv, =
const struct se_soc_info *se
>  						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
>  							  var_se_info.soc_rev));
> =20
> -	switch (se_info->soc_id) {
> -	case SOC_ID_OF_IMX8ULP:
> -		attr->soc_id =3D "i.MX8ULP";
> -		break;
> -	case SOC_ID_OF_IMX93:
> -		attr->soc_id =3D "i.MX93";
> -		break;
> -	}
> +	attr->soc_id =3D se_info->soc_name;
> =20
>  	err =3D of_property_read_string(of_root, "model", &attr->machine);
>  	if (err)

[Severity: High]
This is a pre-existing issue, but does this function leak the soc_device
and create a use-after-free vulnerability?

The attr structure is allocated with devm_kzalloc(), meaning it is freed
when the driver unbinds. However, when soc_device_register(attr) is called
later in this function, the returned struct soc_device * is discarded.

Without calling soc_device_unregister() in error paths or driver remove,
will the sysfs nodes remain active? If a read to an attribute like
/sys/devices/soc0/revision happens after the driver is unbound, will it
dereference the freed attr memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D4
