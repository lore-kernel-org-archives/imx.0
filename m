Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C62EFD87
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555626; cv=none; b=WY9GW3dfocTROncNMCnKvW1KDLvzYpSBt8PnEmsByLJo1e4adp67KD1Kj883dq41KAY0sKurZSjXsYe4SkbIBFgfnZwO0QIbO5ASXHyAmwZZh6Mz1j3Mmn5CE4TpUhxFGFgebjYYNVSy3JRPnhgQXwIJ7f0OecUV9ods3FMDuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555626; c=relaxed/simple;
	bh=qJgf1RF5GwyM1t3Atw/Q+kAszB7c4DDzNJhbDeMNAts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuNV+Oyd0fuf+b6/yV6GvC4m1ALl2RyrziFaMt4WvflYLL6pHqi9kvyBz84qllH4GvzViWStVFodjEX/XSQztfFIP/rdqvpUnDPhcp8iwQFPeLhn5I/oi5HQqTyVIB+oYBovl05Cm5IT3sTVZzm2/JfA0ZnbaSgc3+1kWXZ+sDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZEIrUNy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZEIrUNy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so9916018a12.1
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555623; x=1752160423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=xZEIrUNy1IrF12RsiMRgYi+revM7s6j3h2g3m8rD41ZL8EFfvZj2T61INDm81FyVvs
         F8lLuVoZdCkizBReP2z3CF5QK5t3pURSuV2keIlaIB2cbZyCmGjr4mPOZooyf9rucwOr
         jB9RyBlQuLYJ+5LpGZGwJdRVMywOazHqViN2lGJOsEJTem5cOdrwz7R8JoxrLnj1Wzbs
         +o4guLsnl1B1OqbkhtdCcnSmzPVsl35xpisWnwK6QYoczIDhnfQXzo22xKRF0Nh8daSP
         qBHW3xu3gLM2WDHKbF+zk1yaUHTz9hRnQhfA+b3dehbJj3kFWzTBuN13NVPe/ripH1JD
         vALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555623; x=1752160423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=ccPljF6hP+1DgnZWE2KLkg1CQoIyNSlwc9E7daSzS6DGmbL0hdd34sRrdN0SyZo/IK
         oOiu/ydzSaj/BTx+Uj7MCD9/gEmaOiIf4RTWH6AaWf7TBRK+6JRLPmFXBbHx6+wvp76z
         S6dO9qbLh382ifhysrpBipIhdfsDCOQlYy/zSj7mZV4DWQ15StXkK//NC9QGg/RTaWfv
         CTSLuB98C8aVWEb24iEZKj+oUCPeCRdEhmI+A8G7mg05GOoANUgoRcCAEnJkKTfKC1Wd
         tY+UEA1dOTsR6iv0R+0WYDnlLmo9NHU+kFlh1AqbYeuOB3Oop8tB8ApeARBtHaj+FSqD
         GNfA==
X-Forwarded-Encrypted: i=1; AJvYcCXQbTrR0EAD3F8ivwvkW9JeuAm1UBV1UUYloc6VBdcAjWgxl4kOKl/gQ8pU4qfdxSN6Jlg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5wUgStclu/M41N/x2UINO2Ggq/w+SMY7FB4bsXUoMeWmUYm4S
	cSvdrvpQXMva8WkiQOw4ujEqCRp+lok0uzjbqQl/Xa1LKI+1l//ZstWHf3YYNj25fPk=
X-Gm-Gg: ASbGncure8rgvbVlHlh6nGrexgLm03y1rlrTNG6b0fYbrvzPwuEExMZY2z1piUNEmWX
	W9JEGyhCURvJIW5aLLjEJAqkAcbRK0/FumicgzMKGAXD+yQyqv7BtlWTmR56t358MlyD+uxbNG9
	td4SPql2c4uZbPfsNlTS9+XUiPRNSYmgt12fvm9EFvAxQ1E7vy4dJaLXIoVqi+tY6qPEs1MjwHl
	GwvbTTdiMgwiaVxYUrI0U9xzPPzeAvQfjxQSNmGun8fUfMuYWrb0glipba5q6B3LZdcWMYOewrz
	eP5/6eBXzG5I6BfLJU/lLvj6nIkGbpN7NfeUBXyaABpMcRQLlNBjEOrqWIqen/rITjpxDg==
X-Google-Smtp-Source: AGHT+IHLbeEWvDtZyLpkZYq9v/9MjHWg44ua068Wk7HOmNac3d6CS9uj1wvGNiv38jkJSQ0CP6C9+w==
X-Received: by 2002:a05:6402:22ca:b0:60c:39e4:93e6 with SMTP id 4fb4d7f45d1cf-60e52d1939cmr4886568a12.24.1751555623170;
        Thu, 03 Jul 2025 08:13:43 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1845sm10903471a12.23.2025.07.03.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:13:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Message-ID: <aGaeJIjFMLcV8ly1@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>

On 25-07-03 11:40:20, Peng Fan wrote:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
> 
> Add clock index for the two CSRs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-display-csr
>            - nxp,imx95-hsio-blk-ctl
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */

/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
