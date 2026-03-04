Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9C386444
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 21:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659634; cv=none; b=T+hdTV0HkY7MJhiNM7yPb/5+0ULp3YJw/JA/42x81UwaQnTkz9JWP5zbJhLefHIc2iQUP/eCrihudjG2WDAfL98HiYGdMPBV7IBIjNKhGOcZ262AoO//C+0x19UUcgYi7GsXhVuXgJBsByMDj46cNmcNxuqf4KoDbx9U5ntHrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659634; c=relaxed/simple;
	bh=F2afGMEwB5uJJhwzMOSueMg3oN353FwXCET/CyT3Ua4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WURgUyO2Ddvs3r3OXxg9gABoQd+uZ4w4YCrcJlVky34r4rD5K/rLhM/JdPyKLEJMXzgNvPFwTwFKqb6+qxTuP/l9Z8vb++z8yk74apasSCcWuvrKDUx0pyXAZGrFHnIwgpncJ+dVaprznUx0HCez24WkkosU7sByUgCyhGoxNCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzg3Bi6t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzg3Bi6t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso12280235e9.3
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 13:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659632; x=1773264432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqrYXjS07WWLu9a4fdG6oSfjRISyxlXE1cioRIfnuGw=;
        b=gzg3Bi6tLacJwNAiUR9avdmUluOvIV5H2YjvfLbO2hIP7FWRXkHEt64FboWYL4eEPa
         7IugKoM/J2KRhILeZhti08pO30b+N3MBty2XNLZRyBhEY0rGPKf5bAWBFLidUMGJmp1j
         K8dHyT1RJ8FWC+bQYxPBSaGIZIFmzZrnbWYIosyaAZwllaMuWx4CBiP5F/k2wnvJfnbv
         AQBWY7ZNbELafaLElPY28SmNRw7xAoLjoBb/TsiBO1pz9MVRNWfGTs4vMg29BHQgYjmG
         D1B0Fpshbv85Wa5ILVNFsB7cNlXE/4tw2t7BJIcWU5X5xV8e2QASqoJ7KTDhaVrN0Nqz
         aTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659632; x=1773264432;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqrYXjS07WWLu9a4fdG6oSfjRISyxlXE1cioRIfnuGw=;
        b=VJjVpYZQZVKsz8HIYMJtefoMVqDxd2x0k85M3/tL1zifH94VM5fzqpO8uZJfEHLdVH
         0+xTpo5mYN/r+AE68Zp89pvAeW5sCb4qzbFR1K0Qrsi+enI5Z580wEg5hdg1ZE0WokYO
         2fUQ2KMzIIyoiOkb0FX3CKfFiwj2w9M/VNkwLIcpjuxywtRP8pCrKkTtJig85dFZ/d38
         VxwEr8jHL4YPkTYT9cVkGZWhom42j4+RgSZtUSpQ5dfbB76XELX/5ac+JqpzsdYpvHuE
         2GZ2JkvTgV1SOGBcmeOeVasHvPuVWsosVSpaIZWJZ/6E0eN55ZCy26D8hBYGtj+LGYDu
         IeQA==
X-Forwarded-Encrypted: i=1; AJvYcCUqSra2MJh8BQt9ef0Pbu55UOp2evs3Kr5nKSpf8ktgtPngtNpi5MAJx2cL2RKNmyTUSLo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFuGyGeyzhUgY0fg/Cq9GkF7NYDQEvNXmHPKO/NdOJUTHC0p1Q
	ZR1v2pHMjXcVCvfW39Da6pq65EuW1TlxDAZAY3h2015sy6qJyCHovXmb
X-Gm-Gg: ATEYQzybZf+D7IexN3Kb7hrTOzfUdWVmvfe1agNeHow25hlfzj7FpW+7BE6B0pylExm
	xxezCbEwF9O+rU8rkwBvT2ho1rRmhXmmjmotQ/1/exIe96CCEMpa1LguUphu7WPzlI21A4lhPd7
	VfKILLCJtVL36nF7pZI4OOaqCV0QlI1hfSdDfn84CWxXolS7QBHR4eh3joKZoGqdDsMdE9Go4NY
	06s2iTKsWYl3p++pY3yAXY3PTQlzO1MsL5PAfI3ImHkj+pLTejUEjV3uFdXawpItlsAVAKWYEW7
	0MHmaWquo4l5z9AeNhwAzv/9/AJUXzPOvX2HurnHQbBfauxJ2SDk0sjB3kIrB1CvGIsJHA02moN
	FX4FOMj/J6kSMdDHSBODkVyVibk5aTn4qbtCJwCRx45tKn21Baz11UFtpTo8+ezW4KNVbVfZFR7
	wW458rZvjiT9RpPOrjw1IVUD+7wA==
X-Received: by 2002:a05:600c:8b32:b0:483:7d93:9f8a with SMTP id 5b1f17b1804b1-4851982c755mr35027765e9.1.1772659631369;
        Wed, 04 Mar 2026 13:27:11 -0800 (PST)
Received: from skbuf ([2a02:2f04:d00e:3600:16aa:c9ad:4288:9dcc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a82dac3sm46980315e9.0.2026.03.04.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:27:10 -0800 (PST)
Date: Wed, 4 Mar 2026 23:27:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Message-ID: <20260304212437.z34yjprrovewmlm5@skbuf>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
 <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>

On Wed, Feb 11, 2026 at 03:49:48PM +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Same as the one sent in December but with an updated CC list.
> 
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 279b8ac7822df..4ab45c9f53dff 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
>  static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
>  					      "phy1_crr", "misc_crr"};
>  
> -static const struct regmap_config regmap_config = {
> +static const struct regmap_config regmap_phy_config = {
> +	.name = "phy",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_ctrl_config = {
> +	.name = "ctrl",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_misc_config = {
> +	.name = "misc",

Since __regmap_init() doesn't keep a persistent reference to the config,
just performs a deep copy of it (including regmap_set_name() ->
kstrdup_const()), technically you could have gotten away with just a
single on-stack regmap_config whose .name you kept changing for all 3
calls.

But this is perfectly valid as well.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I don't think you need to do anything further, just wait for Vinod to
start going through the backlog.
