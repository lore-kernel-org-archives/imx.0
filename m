Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAF1E7C12
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377711; cv=none; b=Tei5cA5fDYZ25uO4ZIbfjO6iyfv3HIC4WExyMxRphqslgljereWV2W9iiNXvMvPibV1brUtDUGZfzdMYIwQJEzboPkWn2RFSJXjn+/+DzVJg3PlkR0rkSihqu0Xb/cJce6V/nNSLqHm5kghaLD4TyPfhtPqszbaolIFnyvPhYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377711; c=relaxed/simple;
	bh=Hn9XQxoi9xC5gjKbLwAvdgsOFA+fY9zgUdj+ZK/20pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYS0Hhldx954IqroO0d3xg3UC/ApL5Br1KqG/4xNZU5nQ+VNctGqIbyu69TXeu2tos7Z8LidDL4rQaSn1SL9i9jBviVGd10PNKJQCEdOcOJWE6HkwEAptXL5d5LgrQIGm1osLWeRa4bVdgI/N7GxKfH2tuYk7UtiI/mcf6rK14A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PorNfJM/; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PorNfJM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=beNsCZKtnDZ/kCW2/aDDl5S4J3i4rAjENZyUI1MLHbE=;
	b=PorNfJM/z8Oohl/eipl/U2KBmvOtCwwdC+ghH6peaAI1r7Wj/qX4co4UQC5Gr0
	s+UHkcaitA4IrawjNkgPUH7Wxj1QAUZcSvEK1V8N9kWHnckdfPGTpOQvpK7/gk11
	MFBqku7U8r0RxHwZBvpO533jAH2hzHV0d2kTQia6/iaWo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3V+YQ52NoT3cBAA--.3737S3;
	Tue, 01 Jul 2025 21:48:01 +0800 (CST)
Date: Tue, 1 Jul 2025 21:47:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI
 frequency
Message-ID: <aGPnD7J43tjoHYkM@dragon>
References: <20250604225630.1430502-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604225630.1430502-1-tharvey@gateworks.com>
X-CM-TRANSID:M88vCgD3V+YQ52NoT3cBAA--.3737S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF18Xw4DAFWfZr4UZry7Jrb_yoW3JrX_Ca
	y7K34xJw45X3yUta95trs3XF97K34xuFyIgrWUtFW3Jr9a939avrn5X3s3Aa1a9a1UXrnI
	grZ5X3y5Krya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1iID7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBLwVmhj5xK8AwAA3V

On Wed, Jun 04, 2025 at 03:56:27PM -0700, Tim Harvey wrote:
> The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
> depends on the pins the interface is muxed behind with ECSPI2
> muxed behind ECSPI2 supporting up to 25MHz.
> 
> Adjust the spi-max-frequency based on these findings.
> 
> [1] https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> 
> Fixes: 1a8f6ff6a291 ("arm64: dts: imx8mp-venice-gw71xx: add TPM device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Just to be clear, "b4 shazam" was smart enough to pick this v2 instead.
Still it would be helpful to leave a comment on the old version saying
there is a newer version superseding the old. 

Shawn

