Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266D30F81
	for <imx@lists.linux.dev>; Mon, 16 Oct 2023 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiSnPKMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4E9C433C8;
	Mon, 16 Oct 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697473515;
	bh=9/hvt23CkWCSd3t6m1C0dNGRoz/pDYrD0zUCEPxSYzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kiSnPKMNWSc95QJN5Az/vICl/XNckWm+QRY8UKi+Q+sgo8Kd1v1mfRpTIZLxZLbUk
	 l5F8vNrg1UbMfoa4oRxpvtjO1rkGvCGVfIhxta/gcuOkdYZ/hE7oXDLHxlok/gn5yI
	 XTPh/f6xrE1xZ/5JuAKxAYsbR+DOPQzzrnr4+VX8dNMbEo3O/OlVESsC9mo2iFmV8Q
	 MciK2/Nq/ach9GVBOF97X9rCnLqxQEYsTczGmFw93BX1W4N1XGLr1gpydUVV7EofJR
	 wAtIZ6+TuoliVQwBK7n0klE/d7D4yWx2gw4Gl8tp57B4ZDVmQRHWMJGRCeHO6pIwnX
	 S8KWc+1PpKGHQ==
Date: Mon, 16 Oct 2023 11:25:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <20231016162512.GA1212231@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS1gmJiz8+PKIuwp@lizhi-Precision-Tower-5810>

On Mon, Oct 16, 2023 at 12:11:04PM -0400, Frank Li wrote:
> On Mon, Oct 16, 2023 at 10:22:11AM -0500, Bjorn Helgaas wrote:

> > Obviously Lorenzo *could* edit all your subject lines on your behalf,
> > but it makes everybody's life easier if people look at the existing
> > code and follow the style when making changes.
> 
> Understand, but simple mark 'a' and 'A' to me. I will update patches and
> take care for next time instead search whole docuemnt to guess which one
> violated. I know I make some mistakes at here. But I am working on many
> difference kernel subsystems, some require upper case, some require low
> case, someone doesn't care.

Right, that's why I always suggest following the example of the
surrounding code and history.  English is the only language I know,
but I speculate that this typographical detail probably doesn't make
sense in languages that don't have a similar upper/lowercase
distinction.

Thanks for persevering; we'd be having a lot more trouble if I tried
to send emails in your native language ;)

Bjorn
