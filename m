Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6925388
	for <imx@lists.linux.dev>; Thu, 24 Aug 2023 08:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7716C433C8;
	Thu, 24 Aug 2023 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692864886;
	bh=1Tn6vKJJFKlBGjG8QtuFgkvRlH6W9nCtGYntwAHYyns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DROKImggRM845E0c2tdxVMg6dQJUjn+LhQAhJJ6H+ovC9cECv7K+wabfNVTnZMcrF
	 ykqTm4Iagwnm95y7fivs0qr4lx5z2D6Q8QgQZguyOqttsovsbX+Zcpn096NxV6j09X
	 L3miw0LeHd8LR5qQ662RwztEWxVHwegyw/QOS3WWAnvC3D9JYP4NdXS1I0WKPXjMCI
	 Zz/kQ9D4wDiKM8/MK+N0jI83eTeToNcPipI6OVPL0HV/xIR93RrR097wkdm1k1tyqx
	 vX9EG42PHo3pbBDe4l/1w2lpreaiz860nnpxYySWCJo2AnxJMUooLYn/DomglZvLZy
	 M+VOS3t7+uTOA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: frank.li@nxp.com,
	Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Zhiqiang.Hou@nxp.com,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mani@kernel.org,
	markus.elfring@web.de,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	xiaowei.bao@nxp.com
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down notification
Date: Thu, 24 Aug 2023 10:14:38 +0200
Message-Id: <169286486358.59705.3375218028619595727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720135834.1977616-1-Frank.Li@nxp.com>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 20 Jul 2023 09:58:33 -0400, Frank Li wrote:
> Add support to pass Link down notification to Endpoint function driver
> so that the LINK_DOWN event can be processed by the function.
> 
> 

Applied to controller/layerscape, thanks!

[1/2] PCI: layerscape: Add support for Link down notification
      https://git.kernel.org/pci/pci/c/d28c0d84ca40
[2/2] PCI: layerscape: Add the workaround for lost link capabilities during reset.
      https://git.kernel.org/pci/pci/c/17cf8661ee0f

Thanks,
Lorenzo
