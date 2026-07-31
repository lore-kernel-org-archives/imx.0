Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863802D060D
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461353; cv=none; b=sjz1QXNDOFb1xdk5W+APZNTXSXTHAhMfXq0NDTFv7yOtcuJa7E+6PyRHOFVI70JkM/IVBmqEDUtCR6bMLM01VB7BT0Bve9tRy9a8/hZwgSEuc94DwSDiS2VpX5AgrO49sNZJGnOk+WnUrRAAQwfXbdGRsgg7sQWlchpbx8do41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461353; c=relaxed/simple;
	bh=iuLAWzFNkiEm/YXf8HePx1UgTld7+x38bilQiLuqNTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXJ8PwFTiv4jg9i+UkDrj5RMdJfz6MqMVgBZ6LqSj2tH5qmYZz5vykDBp+axCiqVKornN82dMRsLHCo07Y0ypGGJOBtSo4Hd5XL4/jO5f1igUhMqdvEYsUomqxGqC3pco/4hnmETfonuLVP63ylCdecRe+PpNb7ZWfYEH7TgYq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7Ox3c94; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7Ox3c94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D791F000E9;
	Fri, 31 Jul 2026 01:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461351;
	bh=xnBKFfL5uIeNOG0KKkEc0/IW5sUJzauxQKBj1k+RF8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X7Ox3c949f14mz4EhRFvpKVEuMFSMvkT1jWnMSDAUFJ4Rz3xHtRxghzt1M+5uVxZN
	 s8SEVEp5470x7oIqpapk/8iubdBdYRDUjiegNv+dKsRwyF6Do/XMth28P/GrW3Tysg
	 NHr2NamTL5bbZDnSOtWgreg3xhZp36iNb5wMp+tsJZV3eWxXuzy3c7rK+v50kEbnSL
	 oGk210nJyMGB4OEVEHXPqC5AniVp2lgmN7Prje8uSQ3DCsESLqTZSTs/y9n2qi/78o
	 3p34Rq3gvLWngfWb4rExB9iMR4eBXTZKL5PWb6vILBioYMPWUmjuU2F3YfzpCAkFqo
	 Ad9fE7j41Wmog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260731012130.1212640-3-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
 <20260731012130.1212640-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 01:29:10 +0000
Message-Id: <20260731012911.62D791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores negative error codes from `platform_get_irq()` =
(such as `-EPROBE_DEFER`) and incorrectly shadows them with `-ENODEV`, brea=
king deferred probing.
- [High] Hardware interrupts are enabled before `request_irq()` and left ac=
tive if `request_irq()` fails, potentially causing an unhandled interrupt s=
torm.
--

--- Patch [1]: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq() -=
--
commit 3e29959b7ca66cc613f9380e3c367c87f8883fe5
Author: Rosen Penev <rosenp@gmail.com>

EDAC/fsl_ddr: use non devm for request_irq()
   =20
We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index e4eaec0aa81d5..878d4a86a3c9c 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -623,7 +623,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> =20
>  		/* register interrupts */
>  		pdata->irq =3D platform_get_irq(op, 0);
> -		res =3D devm_request_irq(&op->dev, pdata->irq,
> +		res =3D request_irq(pdata->irq,
>  				       fsl_mc_isr,
>  				       IRQF_SHARED,
>  				       "[EDAC] MC err", mci);

[Severity: High]
This is a pre-existing issue, but are we properly handling deferred probing
here?

If platform_get_irq() returns a negative error code like -EPROBE_DEFER,
this code passes the negative value directly to request_irq() which expects=
 an
unsigned int. When request_irq() inevitably fails with -EINVAL, the driver
jumps to the err2 label and hardcodes the error return to -ENODEV:

    if (res < 0) {
        pr_err("%s: Unable to request irq %d for FSL DDR DRAM ERR\n",
               __func__, pdata->irq);
        res =3D -ENODEV;
        goto err2;
    }

Can this cause the driver to permanently fail initialization on systems whe=
re
the interrupt controller is probed after this device?

[Severity: High]
This isn't a bug introduced by this patch, but might the error path fail to
roll back the hardware state if request_irq() fails?

Earlier in fsl_mc_err_probe(), hardware interrupts are enabled:

    if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
        ddr_out32(pdata, FSL_MC_ERR_INT_EN,
                  DDR_EIE_MBEE | DDR_EIE_SBEE);

If request_irq() fails, the driver jumps to err2 and eventually returns, but
it doesn't disable the interrupts in the FSL_MC_ERR_INT_EN register:

err2:
    edac_mc_del_mc(&op->dev);
err:
    devres_release_group(&op->dev, fsl_mc_err_probe);
    edac_mc_free(mci);
    return res;

Could this leave the device in a state where it generates an unhandled
interrupt storm, potentially prompting the IRQ core to disable the shared
interrupt line entirely?

> @@ -661,6 +661,7 @@ void fsl_mc_err_remove(struct platform_device *op)
> =20
>  	if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
>  		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> +		free_irq(pdata->irq, mci);
>  	}
> =20
>  	ddr_out32(pdata, FSL_MC_ERR_DISABLE,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731012130.1212=
640-3-rosenp@gmail.com?part=3D1
