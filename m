Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AEE216E14
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787392; cv=none; b=NnUgBnWcttIdFnaE4xHsQz/JTz9ql11OanfAajzo/19kmojCbKT8f106FtS+5qmj/f+66Eaf3HKBu2yMPfL/3xqyOSeDxUOZS+wV1NfihcM63oWKF5ObiVPbHpiey81oRoZcp9rISLwebz5mbZZCg4GkkUwyZG0M1/KG4szPbDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787392; c=relaxed/simple;
	bh=2b0ssJvspuRRNhPxDbjfaOIMkY8T4KS4iFr9njlmkNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM4TC8HzWBEZ2epNyqF2S502ZRvR1Xt4kZ9YMpj8QlcHyEEqBpoy5ZJ28++3kHo+HddfK4hdCmmFZmC4UD46H89aSNnDR6C4O8oBwE1HKFyt7gDGenyFt0vlqJC5TTnEZDObxxsHLzDvS3e0b+RoVhfBwFSmoDCZ5sB2x4sYi3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S8LWbg0K; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S8LWbg0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yQZncXsJ08w6dn/CQGrI9m/CtWBS9ZgdPyo1uxiw8q0=;
	b=S8LWbg0KmjlKxqeavmtEOa0jvDw8mdjl6dxM6NqrBFnjaVjyyZne20ehuDXVcc
	FaE33ud6RKBqUTurRhCoD8l8w/xTQFEg1SyiXSPVJau2uyNGSV3EH7T9vMpIPLtm
	Qsgi+qMtM10EVC1iFDh10iSuCbEYnh+l9HU7DVFz5m9hY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3SshDDLNnYyAUCQ--.17238S3;
	Mon, 17 Feb 2025 18:15:33 +0800 (CST)
Date: Mon, 17 Feb 2025 18:15:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 2/3] arm64: dts: imx95: add usb3 related nodes
Message-ID: <Z7MMQ3bqIJ9nFqpl@dragon>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
 <20241204050907.1081781-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204050907.1081781-2-xu.yang_2@nxp.com>
X-CM-TRANSID:M88vCgD3SshDDLNnYyAUCQ--.17238S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVMmhUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ32ZWey5vCopgAAsa

On Wed, Dec 04, 2024 at 01:09:06PM +0800, Xu Yang wrote:
> Add usb3 phy and controller nodes for imx95.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied 2/3 and 3/3, thanks!

