Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360928DF5C
	for <imx@lists.linux.dev>; Fri,  9 May 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785841; cv=none; b=DzdhzOdVQyeqagEWQ01XkxahRQQTLqeL6cYa8ss4WOlmVMVviJ0NSkAEa66ATmr5tvykbBtJdtZl9PCTpWVlcarjAJ+UxpL5dbiuhKmXUX9DAsX0ibkJOVlzOPzhkO7sWh7V6Faxmh3es0Wf+C9AfMhuyQXJW+FsHzor6iyjpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785841; c=relaxed/simple;
	bh=3faH5S8tS2bBc3//H6RC97XaO6WSJoh8wJ/ZnG/rqE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdL/LyPLTrZQILbNLPQiRFwvCEjmPnWp9CvOmOCDGB4u5D9RJQdHa2Aip1s+atwpbmryc4q3eZlc7147Zvl+oKxmMgf5ouX4vXGCLZpPACg1jityBiruZ5eT5iOVKf11f+jw7Z3Mzwwnky4S88lbxm91suPi3x7jw33yK5nKuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iCgaZXRh; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iCgaZXRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RYj+iCZ04f8tZWgdmxGg5BgqxXDWD3VjEstgUEc6ZtI=;
	b=iCgaZXRhN6LlN2ooal29hLGPGeP5qyMLLk5NsgH4hqsTML1ZtktRtqrAzAuUux
	KypUfuWbDrpq2AQIdATW92Ys3snuCOGoisGWXCYhRWRJeoe8BBhMDqdFCE3g8Yva
	s8EeVmN87w5dohA1aAt6px6lO7Ld+z8dP4V6kppcsAGNc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHt_EZ1h1ouMqlAA--.21330S3;
	Fri, 09 May 2025 18:16:58 +0800 (CST)
Date: Fri, 9 May 2025 18:16:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/3] soc: imx8m: Dump higher 64bits UID
Message-ID: <aB3WGZQdin9YcRUk@dragon>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
X-CM-TRANSID:M88vCgDHt_EZ1h1ouMqlAA--.21330S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOOJ5UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBsdgmgd1hsl2QAA30

On Wed, Apr 23, 2025 at 10:37:03PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
>       soc: imx8m: Introduce soc_uid hook
>       soc: imx8m: Dump higher 64bits UID

Applied all, thanks!

