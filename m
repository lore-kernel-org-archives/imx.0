Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BD3BA4B
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736866; cv=none; b=pluTVXULvXo1RX5zN83Oae6Ulef8y52BmIY44Yg/YzFOsr4LITwNB/p6BA6E5eKHcRDT/Vm0UaIz86yYY+e39Y3z+xMyUrPAjNnetJFvlXFrFwoIPHDKBr/qFCJ/zafPYgiXpstTHlSoOD5Ci655G5uzP8hkP5GuD5YLewsEU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736866; c=relaxed/simple;
	bh=fZudXsA6TDgjSpAHmX4TDRaEd1/rte2MAt9Tki0tGHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoxJ2LNWGwKjbnL6or7XUf07rdRFaeFeth8sPtOtVMfCze1TgooX8tiw6kDaaxasPwnxioQIYMz4Re6J/TDL/xf4+mmwwJ9pt/urwt7eOkhUemuxMAuDy0O+vGDsGYI+gg9gsOTDT1QVjoTBGzDpTCRIus0vvZJIVKAMfLzC76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TW88fyEW; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TW88fyEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=J7f3mLAKs5aTYmrqkxyLkc8lw0Zm19/PnV18nFW9dUY=;
	b=TW88fyEWWHpX4hPCESuPi0c1Ax5rCJkDSnFRDbMiTbK+UldlzYLHydGvoeDXsx
	usfdP5EulXo+sM5+frUA/6P5xRUP+D2wPok8UGyBzH5QVyqZcTFHQyf5lIdW30b/
	HgXezipCCOUPAKNeXzDnaZTcOXRnQ9hOiUoIdo8U7l7To=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3f3KAuVZnxPyNBA--.47131S3;
	Mon, 09 Dec 2024 17:33:54 +0800 (CST)
Date: Mon, 9 Dec 2024 17:33:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, wahrenst@gmx.net,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <Z1a5gBgVIl0BAJ4y@dragon>
References: <20241108153546.268695-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108153546.268695-1-eichest@gmail.com>
X-CM-TRANSID:Ms8vCgD3f3KAuVZnxPyNBA--.47131S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrGw47JrW3XrWxWrWDXFb_yoWDKrX_Cr
	n7Ww4kGwsYgrZruw18uwsa9Fs8uay8ursxWrnIqFyag3s0vrs8Z3Zxta4rZrn7Xa9aqayU
	JrykuwsIy343KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08Oz7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBOwZWdWr8gxLAAAsJ

On Fri, Nov 08, 2024 at 04:34:34PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio.
> 
> With commit d469b771afe1 ("ARM: dts: imx6: update spdif sound card node
> properties"), the more generic audio-codec property is used instead of
> the old spdif-controller property. Since most i.MX6 boards now use the
> audio-codec property together with the linux,spdif-dit and
> linux,spdif-dir compatible driver, it makes sense to enable
> SND_SOC_SPDIF in the imx_v6_v7_defconfig. This will ensure compatibility
> with the updated device tree.
> 
> Without this change, boards that use the audio-codec property will show
> the following error message during boot when using the
> imx_v6_v7_defconfig and spdif audio is not working:
> [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!

