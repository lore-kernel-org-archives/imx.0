Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3396F4644E
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724815385; cv=none; b=Fresz1WmCKxX4db29XK0uZrI4uD9gtV59zbRrJft+ssfWthZxzovmLQQ4Kpkdywmn5WgOTdveIwC96Yqj/tlmq1BcSYlhZBmz+HLyN285TpGONp72C5nnjrR51c2FYh7Q3FecWMWEBCNc201j6vSNZSmDU/pIESblhSSFXNn57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724815385; c=relaxed/simple;
	bh=E4uKhK+2Lcgv3JN8clb0pCYAPDKpfulBSPc8gSTpFvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUQqaEhvOKS2RAMH+NiQ4p9EGoAXSDje/URvxlq6YzO//m4hGFtDkHlmF6zYvLswcxKlJWuEcHBLpst+zphEKJy4DUjpcGEzH+mKg3vh4msd1RX9dfxcIPqle7ivkwnvvXmJ6ypbKHYz8wuIMYJTJjx8r7zNKPygv8CvX3TF73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=liaabm9H; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="liaabm9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fk2Ed9YUNzBupdCygQKQYo3+Scmip90B6F4c/27J8ZQ=;
	b=liaabm9HWPs10HrlWJcwnrXk+kVgf8yzpFZjhBja4Tdu6tWiNiFtQUHCCcIxZp
	uMRt/VWkzY6LVZVwSlFaVU7z8w1SMFtSS6jFYF2BMnIeBdd7NF91wjkWMfbFgdSV
	IyvG5Qu6B3Pyr6dsWgtG8s7Z50dK5d2MokXa2ioTWxj3U=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9X5l85mHWUOAA--.18601S3;
	Wed, 28 Aug 2024 11:22:34 +0800 (CST)
Date: Wed, 28 Aug 2024 11:22:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 0/2] TQMa7x / MBa7x DT improvements
Message-ID: <Zs6X+IcoGDCwuVDw@dragon>
References: <20240812141414.96334-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812141414.96334-1-Markus.Niebel@ew.tq-group.com>
X-CM-TRANSID:M88vCgCHd9X5l85mHWUOAA--.18601S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIco7DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgRJZWbOiGVFWQAAsz

On Mon, Aug 12, 2024 at 04:14:12PM +0200, Markus Niebel wrote:
> This series brings two improvements: supporting the i.MX7 ADC paired
> with HWMON support and using a more specific compatible for the
> mainboard temperature sensor.
> 
> Markus Niebel (2):
>   arm: dts: imx7-mba7: add iio-hwmon support
>   arm: dts: imx7-mba7: improve compatible for LM75 temp sensor

We use prefix "ARM: dts: ..." for i.MX arm DTS changes.  Fix it up and
applied both, thanks!

Shawn

