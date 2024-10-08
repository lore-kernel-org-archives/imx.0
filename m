Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0AF1DE894
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391942; cv=none; b=tcu+ISvXBO+ZOXwnWP5T+nlJCpzJKv98zEYH+xgKE6WJ+ft0Be0fudZFbrMMUuOHUfCb4oH13vUcVZGB+6vmDBZE/1OTIgY6vqjLwutSvkwx1bq3ar84dy4N9qBgLXCPsJvglr4w5R+k63XL8TMROGOenVLOGdfkDOm+PjHQaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391942; c=relaxed/simple;
	bh=R0FAUm/64K5+hgdVztbXsyU3EOaOFtn43MW7jrIsS2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsctgCP3eKUnMyaBUZgiJkoHOpebwHChgN/krTNdkyhPBcCF2WDZItEDX0RmKy4SuBQk2evl6d0s/QR3QxCegJcwx4iBax3f9z7Z3ku/3kbYjAZNxYFeM98LPPfqcebJkfBrxNgkOjZWbM1FfWeLEqPl2uS1lv28iKoVJq0IsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VE9SwUbk; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VE9SwUbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BD28PrO7yYv7MhX99QcjOmCqDRPu/8mQMvnuYNenHVU=;
	b=VE9SwUbkKJ3DeVt0lxG3LX9V099fDku9/BW83mR8iUueeJVirr2NNKCDO7iUE0
	+0OW2al5+OJ4ZKJBq1gQ3eoeI4q6OU4LCxrPgaBGtZwl6uxXsBKu4btX0jdu1xVm
	JpjBHurKkQWbNna+u/CeLAAnhBJuoZ4ACKOswrbe0kGo4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDn__brKgVnztnXAQ--.62210S3;
	Tue, 08 Oct 2024 20:51:57 +0800 (CST)
Date: Tue, 8 Oct 2024 20:51:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/7] arm64: dts: freescale: imx95: set
 max-rx-timeout-ms
Message-ID: <ZwUq6/YHyRphZc6Q@dragon>
References: <20240903-imx95-dts-new-v2-0-8ed795d61358@nxp.com>
 <20240903-imx95-dts-new-v2-1-8ed795d61358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-imx95-dts-new-v2-1-8ed795d61358@nxp.com>
X-CM-TRANSID:Mc8vCgDn__brKgVnztnXAQ--.62210S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxJFWUGr1xKry7Jw4DCFg_yoWkKFbEyr
	s2kw1DGws5JFZFgas8Jw4qqw15K3yUCr95Jw13Xrs7Ja43Z398GasFy3s3Zr13Grs7KFZ3
	CFs5ZFsrt3sFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0wNVDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCw9yZWcFFVEw0gAAsX

On Tue, Sep 03, 2024 at 03:17:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With 'max-rx-timeout-ms' property added in 'Documentation/devicetree/
> indings/firmware/arm,scmi.yaml', set the value for i.MX95.
> 
> NXP i.MX95 SCMI Firmware designation does not allow timeout, it will not
> recover if the Agents use timeout design. So set a large value (5000ms)
> here.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index ecdc6b7b5129..7880d3efbd7e 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -294,6 +294,8 @@ scmi {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  

Can we drop this newline?

> +			max-rx-timeout-ms = <5000>;

max-rx-timeout-ms is an optional property.  As i.MX95 SCMI firmware
does not allow timeout, I wonder if absence of the property will just
do the right thing?

Shawn

> +
>  			scmi_devpd: protocol@11 {
>  				reg = <0x11>;
>  				#power-domain-cells = <1>;
> 
> -- 
> 2.37.1
> 

