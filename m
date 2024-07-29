Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF38183084
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282996; cv=none; b=ciuBH45pHcYHXYVN1jTBE5h5TlYyu937ZB/zYPCPvag9suQ5zn72RL6UhwLjJ0G5MzhByC25bSbaIvJ81KGvaHGm4CR7fVGjU+y02gKftQqEDL/xgFWuqU4t2n/SnYBb24r4mxN3uVRMy7DqEcAoQyNV89dcbSuL/RoBQLPboWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282996; c=relaxed/simple;
	bh=YqgXBWqgawrQ2GCIT/CPZ0b/lhDSwL0sHCnAeJKg/xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLep0bfaRTVQ/e3StXsBjg/mwr+lBRBkzgGnt74+LLJEh1EbO+dJ7nCHN9DRx7UKe+iP/sGYBCpiaeC8cdc9jKHEIqhxnZlzTrBQeLd+Fe9DiCu8jnVlelQeBtznhuKV+NnGjeeLbkryKRsuBkn0J/Eo69tQNwIGoasylNu4YVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E/0miJiD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/0miJiD"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efa16aad9so5732756e87.0
        for <imx@lists.linux.dev>; Mon, 29 Jul 2024 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282993; x=1722887793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=020JGgTMWcZIx2NYCO8r+LbUIGlcmT7lsGFDdPjejo8=;
        b=E/0miJiD5hTtvpsk2xpGHRnfX0YVzekZjJ8G3lQr24bikYucB66fF9dQJXSGE0eP3+
         0bV/IdJFawGY52EMxePh2HGLWRruVFrdicSIZjebD5mUgzDNqonFPxXhUdn9lmWR4r/3
         ysxz3n3A/7fOydtyWfpeCMsSxaQQVxvhjn/OX6IRL3Aam10C4I0tz6QLMWNcoVxOrhTs
         6VzMgxCByGZ/vjOmfjGyTSlFlyisENjejei4DWEz48AFgMuZ4/OenhzHr5lzej/F0I/k
         aoUm4rw/zBIWa1ttBCdWopQy6HIDmV2c1C1yxFqvpaVM0FCfjsYBVyOkUZxMKEdrbCnT
         /bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282993; x=1722887793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=020JGgTMWcZIx2NYCO8r+LbUIGlcmT7lsGFDdPjejo8=;
        b=ZylQ1IRVvi6GT07FqbpTXK/cFR3GA8xicou0TNePZZsoItwlQbQQfRmvDXBVx50W4J
         0wFQ83UQk0AdlBcEcK+EIHClaZGCI1P0BRfPxtz5fpRZAZtWzF+kktwEfPL32/rIBZ/H
         4ssymFO7ZU7yVffJpTb2gA1JVxa6clA8OdB38s+x7wvAjqfWzxsWeyPDpg7R131GiHbV
         LNT55YyYzWHACXEpN4u6vZzGHBEjIcM94EBLJEt5kIDmo9k6EWvdBr17MF6CvjozF13Q
         TbPhco911F6cdjGOqPF89+LpNwcVRsJe+chNvSUG44kIzwCadE4sN16A3LVP8/gzv6LU
         tYZw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ywcpiiFFtlxe6FbTPFv8cgFm6XYln8xPbQrMDjVPcEoVsh0t2COpfbUeAA1vk1EQQNybzpGA8mZbij3ryCFNhqGZ
X-Gm-Message-State: AOJu0YwkIeiS+4s7xcJtCJhKRzPMrzipRV7bX8jF8wVS9smE1fvisNmU
	KrTSUBBsvqOWtsb5I/Ra9fb2mc+U32fu7if0hfKsqPAlxY0OKTxcSiEBvyP+DLM=
X-Google-Smtp-Source: AGHT+IGozCHqd0w6iFDoVxOAUJStLvOsB8sp3H77TGFuL7QnXA67z0Bf66cowsXNkbziywq0zm6dpA==
X-Received: by 2002:a05:6512:2c8c:b0:52e:9fe0:bee8 with SMTP id 2adb3069b0e04-5309b269b9dmr6109379e87.8.1722282993288;
        Mon, 29 Jul 2024 12:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2bce4sm1614081e87.251.2024.07.29.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:56:32 -0700 (PDT)
Date: Mon, 29 Jul 2024 22:56:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH 3/3] arm64: dts: imx8mq-evk: add typec node
Message-ID: <2qifmfgul7ks6kozm455jci4rdbfnh5wft3nyt6pdnov6tcbst@vjosluwibkg7>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <20240729081039.3904797-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729081039.3904797-3-xu.yang_2@nxp.com>

On Mon, Jul 29, 2024 at 04:10:39PM GMT, Xu Yang wrote:
> The first port of USB with type-C connector, which has dual data
> role and dual power role.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 7507548cdb16..008e8c37c76b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -6,6 +6,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mq.dtsi"
>  
>  / {
> @@ -27,6 +28,20 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	ptn36043: typec-mux {
> +		compatible = "nxp,ptn36043", "gpio-sbu-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec_mux>;
> +		select-gpios =<&gpio3 15 GPIO_ACTIVE_LOW>;
> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;
> +			};
> +		};

If this the "SBU" mux, then why is it connected to the SS lines?
Where are the SS lines further going?

> +	};
> +
>  	reg_pcie1: regulator-pcie {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -315,6 +330,50 @@ vgen6_reg: vgen6 {
>  			};
>  		};
>  	};
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_dr_sw: endpoint {

the DR (dual role) isn't a physical signal. These ports descrbie HS
(high speed) lanes, please consider naming them correspondingly.

> +						remote-endpoint = <&usb3_drd_sw>;
> +					};
> +				};
> +
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};

No SBU port?

> +			};
> +		};
> +	};
>  };
>  
>  &lcdif {
> @@ -445,6 +504,28 @@ &uart1 {
>  	status = "okay";
>  };
>  
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	role-switch-default-mode = "none";
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +};
> +
>  &usb3_phy1 {
>  	status = "okay";
>  };
> @@ -597,6 +678,18 @@ MX8MQ_IOMUXC_SPDIF_RX_SPDIF1_IN		0xd6
>  		>;
>  	};
>  
> +	pinctrl_typec: typecgrp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
> +		>;
> +	};
> +
> +	pinctrl_typec_mux: typecmuxgrp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_NAND_RE_B_GPIO3_IO15		0x16
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
