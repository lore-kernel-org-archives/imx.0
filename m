Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F434574B
	for <imx@lists.linux.dev>; Sat, 20 Jun 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945669; cv=none; b=E3TO4olEGq6/YL0HAhhzBfCzBayXG7tzZZd0yQwD/cJoZVKQMlCirs+YKn/L44USC/bp/OG741xmalaM2545qV3BRnHgF2Nn7DZ5yil1ofMJl8NqZIjZbjrr1IIGIfRMWK/6Ic18SXaMn4TT6MHNgPi+j2hFltA8HGmI4BjvlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945669; c=relaxed/simple;
	bh=XybK5l1rmoZuBB45s+5PMGPFyRmAv8pmyB60cua/7pM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZ7kJNQnefuNTUmE+O7hrVDPAdq/Bdn6mWKnGySfzoxUrmdXJoAZw16R8NDONSuZWY2MrkYnBigjlSZ7zwQQ30j0027k9m0lva1WfxBvpUadesRhPH2T3kfNE9O4TRMyacU5G9MwvZDCkRBwlHkCWcVENU4jIxWDNTC56+bbuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnCRVL8L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnCRVL8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7D61F000E9;
	Sat, 20 Jun 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781945657;
	bh=yH9nLgS6cn+nxetO0yp16kxYfGuKiK6C+Kf+rCvqREQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SnCRVL8L4eJ7bpI27HemDkX+cbbK71/Idsvl77IQOoqOrV0rT3IBjQtkyFEHhvxlJ
	 w/sX76DKZeBQ5c8Orj911knNmSVxE6eMrBCM/IRriUl25X31h0kUqa2VObj77viyBS
	 JnL8/OKzoRgvHQ37nf+vpa6ilvb1zvA5m/kqRgW7uUBX1Xb+p3diABelzamgwuVoJs
	 fDrVTfNJhNpy5syiUoe5cdvxJewAp/y/ryrxyXe/UPIMK7eFGKNjQufMsHwyL+eYL2
	 BI6yLs9BCEpF7552mxFfB87mPoF/ehWnfB1+BzOZz+MMPTE/DhjmfEQye1ytlJ0vnw
	 CxPLhsxTVWjag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] spi: bcmbca-hsspi: return error from failed
 controller suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_54F5634545908FBA724E758054BF03953808@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_54F5634545908FBA724E758054BF03953808@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 08:54:17 +0000
Message-Id: <20260620085417.AC7D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Propagating the error from `spi_controller_suspend()` leaves the S=
PI controller permanently wedged in a suspended state.
--

commit 4a5c38a8fabc327922f122498eb97084160abb1e
Author: Jiawen Liu <1298662399@qq.com>

spi: bcmbca-hsspi: return error from failed controller suspend

This commit updates bcmbca_hsspi_suspend to check the return value of
spi_controller_suspend. If stopping the queue fails, it propagates the error
back to the PM core to prevent disabling the clocks while transfers are act=
ive.

> diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hssp=
i.c
> index 09c1472ae4fa1..af88ce04948b7 100644
> --- a/drivers/spi/spi-bcmbca-hsspi.c
> +++ b/drivers/spi/spi-bcmbca-hsspi.c
> @@ -568,8 +568,12 @@ static int bcmbca_hsspi_suspend(struct device *dev)
>  {
>  	struct spi_controller *host =3D dev_get_drvdata(dev);
>  	struct bcmbca_hsspi *bs =3D spi_controller_get_devdata(host);
> +	int ret;
> +
> +	ret =3D spi_controller_suspend(host);
> +	if (ret)
> +		return ret;

[Severity: High]
Does returning the error directly here leave the SPI controller permanently
stuck in a suspended state?

Looking at how spi_controller_suspend() handles errors, it unconditionally
marks the controller as suspended before returning:

drivers/spi/spi.c:spi_controller_suspend() {
	if (ctlr->queued) {
		ret =3D spi_stop_queue(ctlr);
		if (ret)
			dev_err(&ctlr->dev, "queue stop failed\n");
	}

	__spi_mark_suspended(ctlr);
	return ret;
}

If bcmbca_hsspi_suspend() returns this error to the PM core, the system
suspend is aborted. Because the device's suspend failed, the PM core consid=
ers
the device to be active and will not invoke its resume callback during the
PM abort recovery phase.

Since spi_controller_resume() is never called, the controller remains
flagged as suspended, meaning all future SPI transfers will fail with
-ESHUTDOWN until a subsequent successful suspend/resume cycle.

Should we explicitly call spi_controller_resume(host) to unwind the
internal suspend state before returning the error?

> =20
> -	spi_controller_suspend(host);
>  	clk_disable_unprepare(bs->pll_clk);
>  	clk_disable_unprepare(bs->clk);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620083931.1120=
616-1-1298662399@qq.com?part=3D2
