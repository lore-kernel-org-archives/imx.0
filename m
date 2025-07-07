Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B8165F1A
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 03:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859194; cv=none; b=qI5oWf+9oHVKPDuMj8lJ1KzaGbGwzDyKqwDhCiM1BVRFlmdYtmoT335Dr/TivZigXMKhCYiyVTW9URD1zucx//wu6It6RxZXmN9Jm86T0EB+3gPXcbISBV1kYjpRND+wf/fbD10JxD+Ob7wk3LGX7UORtbsEMCmeg7fgtYYPfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859194; c=relaxed/simple;
	bh=V8bgU6Y9Srg7Lkwingg+LLqWXZrxI8CBoWErYH2ryYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcuAkSbb4FvbST5WSfXxnrAMp4q5oz8fcSpDnotW2Zsy/3z4kXZ+M/2iPG2KD+WT/pPy+49QzEZGx98W2Ms4N7PWeHlmAKlFh21yfaiOOq2OmgNHrDDocmgFQ3fhpv1DpCutVIx6FBDMp0Db+LMxHdF+dFyM21CBjjEVWzzWq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=meqG47i5; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="meqG47i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yqD3gSRQjmJJbS8nlCnrgcz+xeIvmv28GDtgViA9HD4=;
	b=meqG47i57FfNjO26ICIEITROCN200/JBTduXW6LGQ6BCObWbPl+fMuEbB3KvBl
	BBdjKimHbnwaCzeyGo+leOebYzdHZI5q9mi2wBfY6u3dmWVMsjba2P8K287r9BPs
	qp4UMayIW3weL/xUqbv6UL6FNeUao5XmjD2K0RxP1vIro=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnd+zIP2toQiw5AA--.31332S3;
	Mon, 07 Jul 2025 11:32:25 +0800 (CST)
Date: Mon, 7 Jul 2025 11:32:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename
 overlay to include display name
Message-ID: <aGs_xwcBRUYe2EKl@dragon>
References: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDnd+zIP2toQiw5AA--.31332S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzgAwUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgr2XGhrP8oWrgAA3M

On Thu, Jun 19, 2025 at 07:45:11AM +0200, Alexander Stein wrote:
> This platform supports several displays, so rename the overlay to reflect
> the actual display being used. This also aligns the name to the other
> TQMa8M* modules. Apply the same change for MBa8MP-RAS314 as well, as it
> uses the same overlay.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

