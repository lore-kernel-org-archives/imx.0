Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140D0174E8
	for <imx@lists.linux.dev>; Tue,  9 May 2023 19:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F56AC433EF;
	Tue,  9 May 2023 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683661448;
	bh=pItE0WInMSDSitpSLtD1IAdtthiJmuw3raHHqTpBuXg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UubM7SP5K0CE7+QtObAtFpZP8w1q41xAejPDg3yxVE52X+RSHb+xZ359xeMPGVRHu
	 BNJQFpqOMvZL8t62NgBLvIWI1LnzsBq7HNx15O94PjsBZM5NJaqPJQP2O76El7Fw9s
	 BMq45FZJJ+WbVzImQVyt+xtZEykDlkBY8jbcwa8w2FB3Z2dQwNQWX3pEu8FWFeZTTp
	 1U5PBJzuNvLK3wSiq9y4djH/EcGd7k3np1pz0b2bUIcmqAaRRRYLYFJRzE37DLHFrD
	 kBPuEtcQjFCIQJBATG990NHm2FJ7l6K8iUkyPpc0Y2JztOnKOSoBvC79DCC9zjjSmZ
	 re3ccb6bwn0IQ==
Date: Tue, 9 May 2023 14:44:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"M.H. Lian" <minghuan.lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Roy Zang <roy.zang@nxp.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
 linkup notifier support
Message-ID: <20230509194406.GA1265845@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB4838C21F4C2F0689B13B05A988719@AM6PR04MB4838.eurprd04.prod.outlook.com>

On Mon, May 08, 2023 at 09:45:59PM +0000, Frank Li wrote:
> > > > Subject: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
> > linkup
> > > > notifier support
> > 
> > All these quoted headers are redundant clutter since we've already
> > seen them when Manivannan sent his comments.  It would be nice if your
> > mailer could be configured to omit them.
> 
> Our email client quite stupid. 

Yeah, sometimes those are really hard to work around.

Bjorn
