Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F292DF96
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1dceb2b8823so3113996fac.1
        for <imx@lists.linux.dev>; Tue, 17 Oct 2023 13:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697573646; x=1698178446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjtM0th7Ga0wqAkmHHke7zShNUXUXypfVS93GqDMmaU=;
        b=OtoDoGE3mGuUtiWhnJMYOHGC3rKGZb55zrIUlK4yy4+k+/STBhSE/YMraQhYjL3fqg
         qGctR67gDEGoZrU6hRwiUiVWqsgOfloXnxiujZO9/cRTg6aUT+ejOxUJmpJOoOZQeRH5
         4FS0/aiZZTgf6Nes/aTdAnMyuLXg15WlXHlDlxKvFNlhOEiBXNe7atwGEPcfTwhkQBzj
         Ks+BR75+YXWNzwpl4KsfUpXD8EtXrNRhkTW4eSier2bN+yWjxD7RDt2Dk2zlcYAT5bZH
         /OncNSZ2Y33iUO7qVYz7FqTlwuvHM9OtYkLZk3/P+p0eXEfa5GgpfMe1bBD0+bxTh7Vt
         XOBw==
X-Gm-Message-State: AOJu0YwpgKlW11eho4oEQjm0QN6dZPFWKIcmrDIeMvPAO9qP8bL86p1I
	kr/hv2d6q3Lew6FtNR5Z7g==
X-Google-Smtp-Source: AGHT+IEsn7NyYyz1Bs7OZ8OxYl4q66dyjxMFogx3095CSeMhQzjqBlURuKu92JrCzVigMEE82ibKSw==
X-Received: by 2002:a05:6871:c17:b0:1e9:d481:52e9 with SMTP id ve23-20020a0568710c1700b001e9d48152e9mr1820295oab.28.1697573646610;
        Tue, 17 Oct 2023 13:14:06 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id lb5-20020a05687c330500b001cc9bc7b569sm394499oac.27.2023.10.17.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:14:05 -0700 (PDT)
Received: (nullmailer pid 2675575 invoked by uid 1000);
	Tue, 17 Oct 2023 20:14:04 -0000
Date: Tue, 17 Oct 2023 15:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, joe@perches.com, peng.fan@nxp.com, alexander.stein@ew.tq-group.com, haibo.chen@nxp.com, ping.bai@nxp.com, xiaoning.wang@nxp.com, sherry.sun@nxp.com, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231017201404.GA2570433-robh@kernel.org>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
 <20231016152450.2850498-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016152450.2850498-2-Frank.Li@nxp.com>

On Mon, Oct 16, 2023 at 11:24:50AM -0400, Frank Li wrote:
> Add I3C1 and I3C2.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 6f85a05ee7e1..4d9ed0b32853 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -242,6 +242,19 @@ tpm2: pwm@44320000 {
>  				status = "disabled";
>  			};
>  
> +			i3c1: i3c-master@44330000 {
> +				compatible = "silvaco,i3c-master";

The real problem here is not whether we have "v1" or not, but you need 
an SoC specific compatible. Unless there's a public spec where we can 
know exactly how many resets, clocks, interrupts, etc.

Rob
