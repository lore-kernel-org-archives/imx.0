Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C24928DC4
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 00:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763078565; cv=none; b=gR/1dethdFBtYll9GoitY3OiMQYR2kEy2IYi/h2eIZnQJgQ9ADuB5W46c+7WwWqRIrr/lQGW4BBzsEq1oRxBeb2kiHP+w/vWlUumSHgeXs6VKfr4wuN9FXZIxBmOKwaRMG2S+hxhEKhPqamY9qfZvByKtfsZDPa0nIcMhmz2ttQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763078565; c=relaxed/simple;
	bh=G9nAx/Rk8pmPIrDjulmm2k9R3JaqyIyaAjsqrCV33DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO872kBTTHnXGpeFn+Wt83Itlylwq69BieTl2nT1UI9x8GXOGzrBmgyCZer90sPF0rI8YtZCfzvex1ktyGzqke/JfETTb0fwi+mGKJQ1CAy/ymn6K19P5uhHg9B+VtLIYIXdOMIcSXvlFOeSChKpxFXFHv0vpwA15T+4ta8JMwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=QWfSqg4o; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=QWfSqg4o; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="QWfSqg4o";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="QWfSqg4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078562; bh=G9nAx/Rk8pmPIrDjulmm2k9R3JaqyIyaAjsqrCV33DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWfSqg4ohJGX3QJqM8i9cxILXT4uUcIlZZoLkAZ2NTZnDQfsYRl8euFxDksbVAGh3
	 zbVvZNlRE9LCxuCmGNjDPRYrwxtAHBzbCHUsADWd1+C5hjgHR/MuMIciyITXIukFrz
	 2dKDE9y3C9o5LHl5r/nkCTD7MaaznxQrMYsEA3VpA7L4r0sEuxlWqbZ/GyCqTjIk+j
	 X7vguylJTgB0HkEJDQ7LQq2UL0ZXzu+GQYWAcaxMJl74q9oy9hY2PiYR3iaS05p9tn
	 JB9I2//PFN1MI4y/AqAuB2TE4cjDpMq+Lo8ry1TxLmpn65uuEx8BIJiesZ35L+AKHN
	 9EagZmiyYgJUw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C94A3E1239;
	Fri, 14 Nov 2025 00:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078562; bh=G9nAx/Rk8pmPIrDjulmm2k9R3JaqyIyaAjsqrCV33DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWfSqg4ohJGX3QJqM8i9cxILXT4uUcIlZZoLkAZ2NTZnDQfsYRl8euFxDksbVAGh3
	 zbVvZNlRE9LCxuCmGNjDPRYrwxtAHBzbCHUsADWd1+C5hjgHR/MuMIciyITXIukFrz
	 2dKDE9y3C9o5LHl5r/nkCTD7MaaznxQrMYsEA3VpA7L4r0sEuxlWqbZ/GyCqTjIk+j
	 X7vguylJTgB0HkEJDQ7LQq2UL0ZXzu+GQYWAcaxMJl74q9oy9hY2PiYR3iaS05p9tn
	 JB9I2//PFN1MI4y/AqAuB2TE4cjDpMq+Lo8ry1TxLmpn65uuEx8BIJiesZ35L+AKHN
	 9EagZmiyYgJUw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id AB7ED3E0CE9;
	Fri, 14 Nov 2025 00:02:41 +0000 (UTC)
Message-ID: <b4d8a2e9-46ab-460a-ba56-ff8def8e36d4@mleia.com>
Date: Fri, 14 Nov 2025 02:02:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: dts: lpc3250-ea3250: add key- prefix for
 gpio-keys
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-3-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_000242_264499_762AF9D8 
X-CRM114-Status: GOOD (  12.37  )

Hi Frank.

On 10/29/25 22:27, Frank Li wrote:
> Add key- prefix to fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: gpio-keys (gpio-keys): 'joy0', ... do not match any of the regexes: '^(button|...)$', 'pinctrl-[0-9]+
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> index 63c6f17bb7c9f..837a3cfa8e7c8 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
> @@ -27,55 +27,55 @@ button {
>   			gpios = <&gpio 4 1 0>; /* GPI_P3 1 */
>   		};
>   
> -		key1 {
> +		key-1 {
>   			label = "KEY1";
>   			linux,code = <1>;
>   			gpios = <&pca9532 0 0>;
>   		};
>   
> -		key2 {
> +		key-2 {
>   			label = "KEY2";
>   			linux,code = <2>;
>   			gpios = <&pca9532 1 0>;
>   		};
>   
> -		key3 {
> +		key-3 {
>   			label = "KEY3";
>   			linux,code = <3>;
>   			gpios = <&pca9532 2 0>;
>   		};
>   
> -		key4 {
> +		key-4 {
>   			label = "KEY4";
>   			linux,code = <4>;
>   			gpios = <&pca9532 3 0>;
>   		};
>   
> -		joy0 {
> +		key-joy0 {
>   			label = "Joystick Key 0";
>   			linux,code = <10>;
>   			gpios = <&gpio 2 0 0>; /* P2.0 */
>   		};
>   
> -		joy1 {
> +		key-joy1 {
>   			label = "Joystick Key 1";
>   			linux,code = <11>;
>   			gpios = <&gpio 2 1 0>; /* P2.1 */
>   		};
>   
> -		joy2 {
> +		key-joy2 {
>   			label = "Joystick Key 2";
>   			linux,code = <12>;
>   			gpios = <&gpio 2 2 0>; /* P2.2 */
>   		};
>   
> -		joy3 {
> +		key-joy3 {
>   			label = "Joystick Key 3";
>   			linux,code = <13>;
>   			gpios = <&gpio 2 3 0>; /* P2.3 */
>   		};
>   
> -		joy4 {
> +		key-joy4 {
>   			label = "Joystick Key 4";
>   			linux,code = <14>;
>   			gpios = <&gpio 2 4 0>; /* P2.4 */

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the contributions, I hope I'll find time tomorrow
to send a tiny pull request:
* lpc43xx board compatible strings,
* this change,
* any other your changes with my review comments satisfied, if I get them.

-- 
Best wishes,
Vladimir
