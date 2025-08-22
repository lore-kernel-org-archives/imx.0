Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3881BFE00
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856581; cv=none; b=GXOBsUPmK4qFuMvTxIEsT9MXBHo8szMVwAHhg+iq4txLGpIjDz0DF+D9SUXqjOuvPeHqNkFx9nDQhoV4T5FvJMfzHPVVuU8fRehmup4rrLvgtVsFlLfhDR+wj7Dkix1TXqNlxIDYhnrQu5HLozeDWM8ejsx+cb7C+pWB3uybetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856581; c=relaxed/simple;
	bh=tgckGPbISKEcEPYGCd8ujBQHXdjyOsreicDQ4ji0UDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txSGWLeQ9FJ1/+DCH1oazy5VbaFuVquCecofAHLS0t0tFmLhTXTcoozf5c2bQPolW9LY1kVfUZ6J1TLpJhsIN9jboVrvbfuNHCQDEVIBA9mDn0rH5K/HFqRu+ecv6u5Ts/KV6pSqBKHp+h/s9v1U6mXfP/Uyo8kioCnzkQ0YjVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=T4DxzR7t; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="T4DxzR7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+yjDaQyPgYqGebRjvxpL8l2neia8BuLCnzPQdpLeVTM=;
	b=T4DxzR7tcHi98ViJJbeBYKPBhulpgzrgyRYi9kbKin+yVnymIXkjdpdEyJqEMs
	i88NIHdHaTxrjy1l/JGbjWcw5++tAVsZAgeYppk1DK17rMyoGTv5N8OQMBnjBT/C
	yx1sRWoDEVkTcJwmtCzSPokv6ddQ7nIikD1bnHNh6ObVc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHFG6vPqhobTYWAw--.11247S3;
	Fri, 22 Aug 2025 17:56:01 +0800 (CST)
Date: Fri, 22 Aug 2025 17:55:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/7] ARM: dts: clean up most ls1021a CHECK_DTB warning
Message-ID: <aKg-r76oH34VAH1i@dragon>
References: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
X-CM-TRANSID:M88vCgDHFG6vPqhobTYWAw--.11247S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw17GF4kXFyfWryUXFW3Awb_yoWkuwc_WF
	43tF4xGF4UCrW2ka15GFyqvryvk3yqyFsxGFy3Cwn8JF9xJF13Wan0y3Wjq3WjgrWFv34q
	9r9rCr42q34FyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8VwZ7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhIAZWioPrISGQAA3S

On Wed, Aug 20, 2025 at 12:36:50PM -0400, Frank Li wrote:
> clean up most ls1021a CHECK_DTB warning.
> 
> Old uboot check esdhc@1560000. The new uboot already switch to check both
> esdhc@1560000 and mmc@1560000. So we can rename it now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - squash rename to flash patches
> - remove duplicate patches already post in
> https://lore.kernel.org/linux-devicetree/20250725061339.266125-1-alexander.stein@ew.tq-group.com/
> - Link to v1: https://lore.kernel.org/r/20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com
> 
> ---
> Frank Li (7):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a: Rename node name power-controler to wakeup-controller
>       ARM: dts: ls1021a: remove big-endian for mmc modes
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1
>       ARM: dts: ls1021a-tqmls1021a-mbls1021a-rgb-cdtech: Remove fallback compatible string edt,edt-ft5x06

Frank,

Could you rebase on imx/dt branch?

Shawn

