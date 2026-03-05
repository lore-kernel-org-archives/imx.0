Received: from mx-relay09-hz2.antispameurope.com (mx-relay09-hz2.antispameurope.com [83.246.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6850C326D4A
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696707; cv=pass; b=XXSMxTRWOv6Q56aUKp0jnLfV3cCnWYZ51l9mDBC2oxS/bLQ7+8s0Z4Z91Sq6SJBN3NxUl4GLX7SKK1Uh5c1ZAijKb3SDd6BlqXPcQisIjv50iLFydUZlsjzin7CmDGmxkU6NrM3O/nxrb9W2BeEgNR8ZVWFvV80VdyZTa38SBsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696707; c=relaxed/simple;
	bh=VkfXdhFkXXGCFaGF/PKuBChEyHWQEoWfG/+cE8foJMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdOqTtexps/9tEgThv+Znkh6tx76kmfB+w9HNxTIZTsVCDlLGjoalGlNGdSYN3HBPSi7NBua49npwecOvfXkJbqVIyCYNJjIMVwkoDxVBB8rLZ5mbzeLICm/l/hkVwp+kFC3h6Kxi6vkY+PjIcLsmAvIel928xwYL18yUUbsqL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dMBooV5G; arc=pass smtp.client-ip=83.246.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dMBooV5G"
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772696675;
 b=oyvxkZPUD+KaDvbfeUbPMvxBPP++Znyl6hBR+pglgbUop+xApdrcu+Jqs21mtyG0Xzdrs87b
 CTq8BS/OQ42eljs7MwCVv2m8gpbTrcAecv7CCPxAYALiyc4TVnraEGbYpMaLk9pY4iI6nj32Hdc
 W3z2rzlIpHAABIQ6B4tMvDJAogZsChoudQRONOxO9WCdfhtilYkU4+I31/nyiTeDn1zqFitcFhb
 hc3cNYJLcxwpOYg4uH+EFLzN1GEjSKTKIooQbVoNrIbyr9wJL8E5MaIr/RpHYFIZVjPytgegto5
 rNf7Obm0ayZ+bkaGInqepUFFUlEWWLFL4q92ADVs8vaPg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772696675;
 b=elSUn0ZrneFMgi4NhGNXcQG3nqU47pAuCJbzUaiO3KvK/l6JqkM4uVzDUOxoYqsH6VsRRM3+
 9m/+t3FEiALKKw78YsZZ8Em+zcMQBjgyWnwxFOsLFwat3hMwzlgEm0XTWY/J4rRZBd3WfxRmPOw
 EwwPxZZiNBj//zFih2XGb5yidiDY0+/7VKynGeLicKVgAUe+Z74i/0TA+/4V7iMCB+Oil29xT8R
 TC/YvXRAElHFIe3vc3Dlcvj7FTNBuz/+RrrP5b3F7xbwnYRqDCCzpEwCO9s59xZzCz/+VRZUcQ+
 Wjow/JZu3uruXVzWhy0wuo5TctxWqfL+EECX5zKluC2kA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Thu, 05 Mar 2026 08:44:34 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A6767CC0E88;
	Thu,  5 Mar 2026 08:44:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Date: Thu, 05 Mar 2026 08:44:26 +0100
Message-ID: <24409695.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
References:
 <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4fRM4W2hZhz20nLZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:135cf0209f1aa8681b8239cf7f35b7f4
X-cloud-security:scantime:1.604
DKIM-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772696674; v=1;
 b=dMBooV5GgeEmNBsJm+HBdN+9FE5jYwCjHA1/MiOfr+ukApu3wKq7RiUnsPbOhC6Gk8fyOPig
 O/8V/IWtsgJ4DbmZpHpH+wNGbZt6iTbEoSflLj2DMPijn82H4Lg/fiaGcu20JUCKNX9FiPnF/kb
 aYgrvjcEGzoO9sAYOBPkz3nK7xKYKwXVhBB0HIje0byR9Vurx+Z6ihLKWK+P3FHdk0xU4CkYiED
 Rs8PfIYaKdbEe+mw66TeZrYvrss4YaK+cBT2NIRpRxc4To6BDxrNzE7jsl5bx2Auz4MXZv8stXA
 p3ycCXpA7Zwoj8+ioLQKtS3/rPr708A1jbW//l3xyT46A==

Hi,

Am Donnerstag, 5. M=E4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add reset reason string table for i.MX95 and introduce a helper
> (scmi_imx_misc_get_reason) to query and print both system and LM
> (Logical Machine) reset reasons via the SCMI MISC protocol.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 73 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-mis=
c.c
> index 0a8ada329c9de3c1627da241bf142fa91a8085d7..16b5ff833d21274403a4c55ab=
e2fa1f49fce3e73 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -18,6 +18,29 @@ static const struct scmi_imx_misc_proto_ops *imx_misc_=
ctrl_ops;
>  static struct scmi_protocol_handle *ph;
>  struct notifier_block scmi_imx_misc_ctrl_nb;
> =20
> +static const char * const rst_imx95[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "cm33_exc", "bbm", "sw", "sm_err", "fusa_sreco",
> +	"pmic", "unused", "unused", "unused", "unused", "unused", "unused",
> +	"unused", "unused", "unused", "unused", "unused", "por",
> +};
> +
> +static const char * const rst_imx94[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm70_lockup", "cm70_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "wdog6", "wdog7", "wdog8", "wo_netc", "cm33s_lockup",
> +	"cm33s_swreq", "cm71_lockup", "cm71_swreq", "cm33_exc", "bbm", "sw",
> +	"sm_err", "fusa_sreco", "pmic", "unused", "unused", "unused", "por",
> +};
> +
> +static const struct of_device_id allowlist[] =3D {
> +	{ .compatible =3D "fsl,imx952", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx95", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx94", .data =3D rst_imx94 },
> +	{ /* Sentinel */ }
> +};
> +
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val)
>  {
>  	if (!ph)
> @@ -75,6 +98,54 @@ static void scmi_imx_misc_put(void *p)
>  	debugfs_remove((struct dentry *)p);
>  }
> =20
> +static int scmi_imx_misc_get_reason(struct scmi_device *sdev)
> +{
> +	struct scmi_imx_misc_reset_reason boot, shutdown;
> +	const char **rst;
> +	bool system =3D true;
> +	int ret;
> +
> +	if (!of_machine_device_match(allowlist))
> +		return 0;
> +
> +	rst =3D (const char **)of_machine_get_match_data(allowlist);
> +
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);
> +	} else {
> +		dev_err(&sdev->dev, "Failed to get system reset reason: %d\n", ret);
> +	}
> +
> +	system =3D false;
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);

Is there a way to query this from userspace programs instead of printing in=
to kernel log?

Best regards,
Alexander

> +	} else {
> +		dev_err(&sdev->dev, "Failed to get lm reset reason: %d\n", ret);
> +	}
> +
> +	return 0;
> +}
> +
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle =3D sdev->handle;
> @@ -133,6 +204,8 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_devic=
e *sdev)
>  	scmi_imx_dentry =3D debugfs_create_dir("scmi_imx", NULL);
>  	debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslo=
g_fops);
> =20
> +	scmi_imx_misc_get_reason(sdev);
> +
>  	return devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx=
_dentry);
>  }
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


