Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7C219925B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461288; cv=none; b=Kh4NYPuBRpM4OJJhAGqo49c58K0GNTxl8YW8W6D04QpZ26BfYg1NwI1NSSBKxj7oUNOVgO1orE+On9q63xdZIF0nO2ZoOWygyVga0L9OSEgXT1MDXfLYWhaHPgzemBAOlawNVmrEE3d5TYW0AmZUShh5upcLY7F4gEnSz/N8s5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461288; c=relaxed/simple;
	bh=UpIhy6ONjO+Fga90pjXdn+xEmrcqSSZ/ILq/5/r2IW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp3xQgTwHC3Cl6U3Gaow1KiIv1ULsdwOz23dtAXjNkvW/8Nk13KfEXtrIxVhme2jAqyN/q587iXbSqtcMWGbYHpD8TqDinYv6kcWgmfnRVHmNQSYvt5qzpXCdEjfxuSjekEu1GDXsMwjDFZwM93d5+QfiF5n8wfqcDTOQ9DfG4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PWBHOkBe; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PWBHOkBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=c+ww708aRc0qAteUCkjthXfj1VPpWdpi32cBrs7jx40=;
	b=PWBHOkBeUaF7mXHNKxJLf+YgphM25RjX5LqSCZLkCvuMz5RQTODLV+3SIEUMem
	vWWdt5Xxr9lFpGM+3Wh88y4mPHmOjr+CfR8zcJHXGOS7Sh5yukjMRjTkKBTUcXgH
	u/0gyluq3eZs9QSbBZgBRWGtzTmFei0Z9moJZKXVst09g=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXvSdGviRndu1qAQ--.14047S3;
	Fri, 01 Nov 2024 19:40:56 +0800 (CST)
Date: Fri, 1 Nov 2024 19:40:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix
 coexistence of output-low and output-high in GPIO
Message-ID: <ZyS+Rm8rRkPX6L8S@dragon>
References: <20241023210313.1390767-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023210313.1390767-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgCXvSdGviRndu1qAQ--.14047S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF45ZF47tw47Zry5uw13CFg_yoWfKFXE9a
	sYqw4xJ348Crn0kwnxCwsY9rW29r1xWrnIqr1Sg398KFWFvanFyF10vrySqFW5CF4jyr9r
	G34ktw1UXrWF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgeKZWckfBi+WgAAsp

On Wed, Oct 23, 2024 at 05:03:13PM -0400, Frank Li wrote:
> Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> tree overlays. Since /delete-property/ is not supported in the overlays,
> setting 'output-low' results in both properties being present. The
> workaround is to disable these hogs and create new ones with 'output-low'
> as needed.
> 
> Fix below CHECK_DTBS warning:
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb-hub-hog:
>    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
>        is valid under each of {'required': ['output-low']}, {'required': ['output-high']
> 
> Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR overlay")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

