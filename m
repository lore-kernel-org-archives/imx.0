Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB225176FCE
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379550; cv=none; b=Z/kM9xkhJtxxYB9ECbO86rkiON6aftJotk81uksEuheHOJUDAbTGvSILLlWGgdn04q2iPvRqmLyGpYQYet5DqWdMBR+6nLf+SDc/YiWJpPTTgQnmpx2s3ubTCA1VBbSH/s1ohL6gFG7P4RJAUrhkcrIZe+HkhM0H30s96J0ABFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379550; c=relaxed/simple;
	bh=lXImCGOIV8ofiAWXg7X8KTqTfmX5IawfBQQDWqjOauY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lca+/MGKsros56Z/CCgkbN0BXvk+3FoeLNO3UjRjg3UNQKvbfdHKhRFcrKYqyRcByORLo3/cv0emnWH6DrPCjUe+NjzeRJ35mImCgNCJHTjGZxmlXKR8SYqlB+P9+2jFaRkj73q60keG5Rw+QunqivSs0TVGcfAMtroZyL7llUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LDd6sCub; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LDd6sCub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1a9lowjkwCMX6opkXfn6n+6wUzkD6nE2RciTHCcB/mc=;
	b=LDd6sCubDwIe0HYnhOPZsNpsbYBgp/wzmObjqOYpStSDdPhyS/Pe2XiNekt/KA
	/BsjlUDDk8+ji5eoey3NxVhzPbppiQuR8XYcgIDaDc10v2mfpGa7kKMZGg48e/0+
	DHBuWEGk2xNnvDWqL4mj6rU99EYG8gtiv1z3XmKMAY5xQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXWqGI+gRngDvdAQ--.25114S3;
	Tue, 08 Oct 2024 17:25:30 +0800 (CST)
Date: Tue, 8 Oct 2024 17:25:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v2 0/2] add S32G2/S32G3 uSDHC pinmux
Message-ID: <ZwT6iFYOmCIhYUNQ@dragon>
References: <20240830113347.4048370-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830113347.4048370-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Ms8vCgDXWqGI+gRngDvdAQ--.25114S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWkCw17XF1DCrWrtF47urg_yoW3WrbE9r
	WfC3WkCryrurWfAr4Fy3Z7Ar92kw1DXry8Arykt3yakryfJrn3GwnI9rykXr4UWFy7WrnI
	k3WUtFyv93saqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8DUUUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgtyZWcErZHzWQAAs7

On Fri, Aug 30, 2024 at 02:33:45PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This patchset adds 100mhz & 200mhz pinmux support for uSDHC.
> Hence, UHS modes would be supported on NXP boards which enable
> usage of VCCQ voltage supply @1.8V by default, with no additional
> hardware (board) changes required, such as S32G399A-RDB3.
> 
> Changes in V2:
> - Added patch for disablement of UHS modes for NXP boards
> where VCCQ voltage supply is set to 3.3V by default.
> - Fixed S32G2, S32G3 dtb checks warnings related to uSDHC
> pinmux renaming.
> 
> Ciprian Marian Costea (2):
>   arm64: dts: s32g: Add S32G2/S32G3 uSDHC pinmux
>   arm64: dts: s32g2: Disable support for SD/eMMC UHS mode

Applied both, thanks!

