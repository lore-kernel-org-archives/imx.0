Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35E72BAF7;
	Sun, 23 Feb 2025 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740295321; cv=none; b=YWAZARPzVmWWcziqHR4ZdGuk6dPfLdSZ8D5F4IvUuRx0dt6JNzQ/Mn5N6CzJefYe86WkvGPXiOtjKBYiPzlvL7OQ/wXITxeyiJk8tgvtl/wP5q8hn2O3IHWr3ZE1AewFqupmgHuOwYZcD5sjp+QepJvuHRaYbDcou0mkJg24uCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740295321; c=relaxed/simple;
	bh=nGyfLB/fx7ZPd0J5Y49mn0isbQeGuFYMvEeVgYfsi40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6O0v3JnhckLvwZerBrAopiCVGy+y+nE8CFCiJLCn1B6h6mygSCsOyAbjNZ9gIMJOxBRIM/3f8H8mj/APGHeCHD4GD+TABA6mm/4v+91fQCfGBLn9kEwWLKJE9xz5kQ8DTC2m99havq4vHNnGXgdDVV0gv5rAslMuknI6GuLXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EXuso7zT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EXuso7zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9y4HplaZVCu1QQjMAnhjKML9wwHJeOFR7OdXRZKJR4s=;
	b=EXuso7zTjRTSduWNS6SUjCikx4WLdlc5rZmclXdlA/4OTl/VNctCXl0HhEX5jI
	DGA06+qWahBDZyhHrB0z5anwOLLSWiKaC7/JjW7VYCj6/YS19TGs7e7oSFwz2f69
	YqtVXwxG/33r2ZtT4iTBFw6vx6Knh6mV0Ng07gholDUCE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnC6x2zLpn1yKfCQ--.22908S3;
	Sun, 23 Feb 2025 15:21:27 +0800 (CST)
Date: Sun, 23 Feb 2025 15:21:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>, soc@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on
 ARCH_MXC
Message-ID: <Z7rMdg7+m6qa0Hft@dragon>
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
X-CM-TRANSID:Mc8vCgAnC6x2zLpn1yKfCQ--.22908S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xZr17Jr13JFW3tryrJFb_yoWxAFXEv3
	9Y9wnrC3s5GrZ7KF10gr1ayF1Sg3yqg3y5Jw1IqF4agFySq34xtF4vy3s3WF1S9FZ2grya
	kas09rsI9ryaqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0uMKJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgb8ZWe6xy0Q-QAAsH

On Wed, Feb 05, 2025 at 03:41:43PM +0100, Geert Uytterhoeven wrote:
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
> 
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the patch, Geert!  But I have just picked up the change from
Uwe [1].

Shawn

[1] https://lore.kernel.org/imx/20250204101531.233549-2-u.kleine-koenig@baylibre.com/

