Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68148101F7
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 03:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050549; cv=none; b=cd0VysP2hR/Ql39Jj/ygB7KrEYs1KYyDmAO1EYoKR3HrG1zKdpzQi3ZoSA+kuHWlg2VVSGU4DwbH5ddsq+vjmeS2TKCT+rIoINK8lt/VfRbTS/J26FPnpG2h57HkAWe9INfTptISjN4rxyb+rRK3S1jMirVmx148oOOzIYbhe8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050549; c=relaxed/simple;
	bh=5rl7VH8L6iLNEFrhwYrW8yXL9lh5vJIeeQzAcZKsO0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnTU/qQdmrC6OLhiF0DxalUDJ03ccNv3yjeD/0oFPS26QRcA14czQA0fb6p3Oi5O1dA50Rv0Bpe1wLSURutKeBOQVS0WgF6mrSm/ycvMNh6hU89SaUcqLRgFcKeI2E/WVPd+29+5CNEjQO6w/ZuAOyxqv3/2O/Z8nI8iidYlwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KmcmHrrG; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KmcmHrrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5y5oqftq+ocfRHFauntiQYUuSJ9+uX2eH92sTX83kBk=;
	b=KmcmHrrGjNgTu+rSi8f8ANr694w64EVxsPtZUSPzVR1g9nH0K3W8j1nxPJToZE
	v8jG0NBJJpLIFxUGVTcd8Ksu5KyzdnisjyGgiMLOKj/lENx9SBb44Y6tkNE9m38D
	yC3LmjxgfAnIF12ZCV+yzw8gOQVzazHJDK0pYsflgPxgI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnaNyQNw9n3dMVAA--.274S3;
	Wed, 16 Oct 2024 11:48:34 +0800 (CST)
Date: Wed, 16 Oct 2024 11:48:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Carlos Song <carlos.song@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	frank.li@nxp.com
Subject: Re: [PATCH] arm64: dts: imx93-11x11-evk: remove redundant "sleep"
 pinctrl in lpi2c2 node
Message-ID: <Zw83kAFABugIDiPY@dragon>
References: <20240903093911.3235306-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903093911.3235306-1-carlos.song@nxp.com>
X-CM-TRANSID:Ms8vCgDnaNyQNw9n3dMVAA--.274S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg96ZWcPEZ+K8QAAsf

On Tue, Sep 03, 2024 at 05:39:11PM +0800, Carlos Song wrote:
> In lpi2c2 node, default pinctrl and sleep pinctrl have the same value.
> So "sleep" pinctrl is redundant and remove it.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied, thanks!

