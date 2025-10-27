Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0862D6E4B
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544491; cv=none; b=NrHUiyErXCwukxKYwiHqtJdZ2ioh/vllo6nc3OhdtpwVjHX36BET5fWJemWEsFUyV88FghJZbhueWDL1LfllVhVHiUYhEo9808v8UQy//ICg6ChSfaaPFl054TUe/ayAyS8M2O9BX7HedkmDcqiWIWAzjatsa68GHpBGAoHWHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544491; c=relaxed/simple;
	bh=lwP5FYAMG+CA6PuikcdMmjSwA1h02EAFkhcU1pe2kaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C14cOA4xqfhhP5JdY8td9TTVZ49OOcFs1C0KSl9SiM9VnF6AWI4V0rMzHaO4ua/ZdKVOrmxtxqEua0k+0zh+7zc0NJoyHHH07xCQkWHStDekwvQlS6TlImfrHam3uTCxUUNOEWB+ceFL1QmMveppCUSPcuTkpPWuKzXOkXycRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EPgcQSvS; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EPgcQSvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9JD8XR0rMxrds3N4D+/LhBdcJlCyVkkK883MJ9eIDgs=;
	b=EPgcQSvShWq7imV9BCWPHd9qQa2e8o8GJVLiQs+Jg7ox33hUKaJgfvHtt6/LQW
	V/nFlr+f04/BLnZFz+9NLsKikk89T6+E1f+pL+R0QNMBZi6lSwgPPhVydYyWQR6x
	SLafhlxzl56UEJUnXi56d1yT1sOCU+Vw7pdvEJkesb3B4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDX_1nCCP9ojEW+AA--.29661S3;
	Mon, 27 Oct 2025 13:53:08 +0800 (CST)
Date: Mon, 27 Oct 2025 13:53:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, ebiggers@google.com,
	ardb@kernel.org, dario.binacchi@amarulasolutions.com,
	martin.petersen@oracle.com, alexander.stein@ew.tq-group.com,
	stefan.eichenberger@toradex.com, lukas.bulwahn@redhat.com,
	tytso@mit.edu, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
Message-ID: <aP8IwcTzRuj542A5@dragon>
References: <20251013121709.104546-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013121709.104546-1-andreas@kemnade.info>
X-CM-TRANSID:Ms8vCgDX_1nCCP9ojEW+AA--.29661S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5mhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQRNsmj-CMRJcAAA34

On Mon, Oct 13, 2025 at 02:17:09PM +0200, Andreas Kemnade wrote:
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
> 
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!

