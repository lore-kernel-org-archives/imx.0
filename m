Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCB34CD9
	for <imx@lists.linux.dev>; Tue, 16 May 2023 12:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066ABC433D2;
	Tue, 16 May 2023 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684241129;
	bh=wjM5oFomx6xoKxCytECad7mDyvM6ZglQgt1r7YdvqSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjIElkh1dbl64L4hjcPt0hAtGCMeFxcXVv79SZjRxpA3/kycFGSC/HiqBv1MPYBSX
	 BPkPIJ/DMnT8u4HfuN3g44KSV8XxONANbYDmKmMIlcsq8JCQNMKQ7Iv+4QcljTo1wU
	 6GkpXxq5FtgOyJvNMfT5w5qacJ/6LvIV4//kqtJMF9s5Q6/Dg31zzY/UeprDembQcE
	 BfcFl4nve9uHdba/MPV5YwOxC+3J8aGNwCYJzc0t53sD1jgZt0hIP5yNbnSXNSyqnd
	 tm5EJ7qjiADFS7yeS8ZD3+Cfi9xlVnD/T8iet3/nGhDRGcut6iX0z9RgVR1O4xwEi+
	 o6D1ynTkpAq7Q==
Date: Tue, 16 May 2023 20:45:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	"open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size
 type
Message-ID: <20230516124517.GH767028@dragon>
References: <20230515162053.2825405-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515162053.2825405-1-Frank.Li@nxp.com>

On Mon, May 15, 2023 at 12:20:52PM -0400, Frank Li wrote:
> In cdns3-gadget.c, 'cdns,on-chip-buff-size' was read using
> device_property_read_u16(). It resulted in 0 if a 32bit value was used
> in dts. This commit fixes the dt binding doc to declare it as u16.
> 
> Cc: stable@vger.kernel.org
> Fixes: 68989fe1c39d ("dt-bindings: usb: Convert cdns-usb3.txt to YAML schema")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both and will send them as fixes for v6.4-rc through arm-soc tree.

Shawn
