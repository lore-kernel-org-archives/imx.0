Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F039FD9
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763166234; cv=none; b=JE4k0HO7GzTle3lZ8r8B3xt6E86rV3LSHql5LPNMDRU6dFiyEMiurcuEsq5bD3Fsj8OgJwnGBXOrxBu6tGForZbgNtrYq/4RaOxKJCAWSjhMvjOewPqDmzA//i/ExAOfKshpCO7qNZONEbkg/fB4uhSb0j3qti1/lavVGwjP4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763166234; c=relaxed/simple;
	bh=2Pvm9rdf8esZYMdqtfF58dUSn/ME0IgpmVd/eZocWs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7ipcQY8zFsBT6xYlXslly6Yi4mNb2Zat3+7gkxEZ7YHOJ1SYcynohc/RSbv9OH+yAaklPkK9uhO3AT/jdb+pO+NcWUFXDtOUl9lJPHCOUz0k8z6xTW1hezb9c7j3gOTpx9cZyhkIqEYEQUTjHWmJjcD/y4LCKe2yVwGwBwh53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=eFbslJBO; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=eFbslJBO; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="eFbslJBO";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="eFbslJBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763166231; bh=2Pvm9rdf8esZYMdqtfF58dUSn/ME0IgpmVd/eZocWs8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFbslJBOSnXGlGy+SnugmqJLAKSR4Dv/qMxzJqdn9C9N9oaRDcC1IAMCehogjOwYH
	 2mvbwJclJaNNGk0/sfTb/2PveP+nV5odW+UEDhVAviEue3dvk3PWo6aauYonWxjRVk
	 1IIDK1Py55lGP77GMxxNd6ivve0566vrwi1QauMRpVXkVZGS4htzgJ+kxisaZTXCIc
	 BtxE9Uzhri3H6Ypk3ZpebriGJOu/VEaURldQrUUqBPuSI6EUQhBVgqVw0zyXT44aIF
	 57J0LZghtUhwr9nXRrg1e/67gXV+OBf5kOhr6JlpYA/yFfgDHw856R9QCfi3V3Z5R1
	 eL0dKAtcJulLQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 2C71E3E16D7;
	Sat, 15 Nov 2025 00:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763166231; bh=2Pvm9rdf8esZYMdqtfF58dUSn/ME0IgpmVd/eZocWs8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFbslJBOSnXGlGy+SnugmqJLAKSR4Dv/qMxzJqdn9C9N9oaRDcC1IAMCehogjOwYH
	 2mvbwJclJaNNGk0/sfTb/2PveP+nV5odW+UEDhVAviEue3dvk3PWo6aauYonWxjRVk
	 1IIDK1Py55lGP77GMxxNd6ivve0566vrwi1QauMRpVXkVZGS4htzgJ+kxisaZTXCIc
	 BtxE9Uzhri3H6Ypk3ZpebriGJOu/VEaURldQrUUqBPuSI6EUQhBVgqVw0zyXT44aIF
	 57J0LZghtUhwr9nXRrg1e/67gXV+OBf5kOhr6JlpYA/yFfgDHw856R9QCfi3V3Z5R1
	 eL0dKAtcJulLQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 9AB153E101C;
	Sat, 15 Nov 2025 00:23:50 +0000 (UTC)
Message-ID: <face044b-01ed-4077-b497-3caaccf57c98@mleia.com>
Date: Sat, 15 Nov 2025 02:23:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ARM: dts: lpc3250-phy3250: remove deprecated at25*
 property
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-5-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251114174712.1206027-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251115_002351_196234_3663AD21 
X-CRM114-Status: GOOD (  13.68  )

On 11/14/25 19:47, Frank Li wrote:
> Remove duplicated deprecated at25* property because the same common
> property already were added.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - new patch
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 15463a96938cc..0f96ea0337a1f 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> @@ -213,10 +213,6 @@ eeprom: eeprom@0 {
>   		pl022,wait-state = <0>;
>   		pl022,duplex = <0>;
>   
> -		at25,byte-len = <0x8000>;
> -		at25,addr-mode = <2>;
> -		at25,page-size = <64>;
> -
>   		size = <0x8000>;
>   		address-width = <16>;
>   		pagesize = <64>;

Just squash this change with the 3/5 from the series, or I can do it on
patch application.

My ask about splitting the changes was about a separation of the 4/5 change,
and it was done as expected, thank you.

--
Best wishes,
Vladimir
