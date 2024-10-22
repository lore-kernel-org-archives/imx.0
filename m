Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D0413790B
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729566932; cv=none; b=i/aZd9cGJwgyW7Tfp+sButM4DmpHM3pC55i8M+A5Q5i6ca4f64r7bkkNQ4BZf4EPfdC5OYx+q9RknS8uC48R6AwbY8I8pOiAKB7iEVlX7mAOr6O7fzbKXq5dA5LAjFTVoimLCCRLaGpbTD7m7EfdYIUF7izypkmcVWsen63o9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729566932; c=relaxed/simple;
	bh=Y8QMoNWGSW0vi6cEKbJlXyQDVhOE9k7ylYhYgnQAo7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1e2ibO0jqdPkKAYNeP8/yCAi3iaHiC86PS5Y6Em15i313vn+zZ7sMpJnOx9SNbe8R8D/7SC8e4mz+E+AgesTLZgB29gmlUDhtFlFmxaiPsUP4dmo5hf9Ga4Jlg3HNuRDAjbU7AZJ8GTa982ko065xWJ1RU/PXVKylQS3PjBZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZBSF0lnm; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZBSF0lnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=o9wXe8/tO2owOYA8EggBQaYZFJ2LoLa0Ziam319oyYU=;
	b=ZBSF0lnmiw2pky5Fa3Fzaxq6eRXapFgB3RqiPrrbA4gp5s5gNpokApUC60d8KR
	t/QBwVhPnlj3bqWslOG4swuPHHDwWdxRsLQq00HIM9yXaciUxSy+NYXSryjga1zc
	mLxVrkIdkg2HdM+E5QVg7aK20QpOMR6MRdEWNRhhZSinQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXnu61GBdnVYeUAA--.5333S3;
	Tue, 22 Oct 2024 11:15:03 +0800 (CST)
Date: Tue, 22 Oct 2024 11:15:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v3 0/3] arm64: dts: imx93-9x9-qsb: Add sound card support
Message-ID: <ZxcYtcBZcYSWJBNt@dragon>
References: <1729068557-10073-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729068557-10073-1-git-send-email-shengjiu.wang@nxp.com>
X-CM-TRANSID:Mc8vCgBXnu61GBdnVYeUAA--.5333S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUab18DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER+AZWcXARRYfwAAsp

On Wed, Oct 16, 2024 at 04:49:14PM +0800, Shengjiu Wang wrote:
> Shengjiu Wang (3):
>   arm64: dts: imx93-9x9-qsb: Enable sound-wm8962 sound card
>   arm64: dts: imx93-9x9-qsb: add bt-sco sound card support
>   arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support

Applied all, thanks!

