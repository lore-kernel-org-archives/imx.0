Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997B5663
	for <imx@lists.linux.dev>; Thu, 15 Jun 2023 08:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA3DC433C8;
	Thu, 15 Jun 2023 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686817388;
	bh=oKnnEN/3/0K5S/IpaxAfeYE2ONcRBKAWQT5d6KIBaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qa3eBkRpoPV5/zSaZAhXK77OULHOsalfQeVCwd9BXonl+gc1Eh/BVABziJfkUv+nx
	 1QZCLtWPDLV4T9J6qSo2hwl8ZNyfnFx4JLKCcFyBU0XYyLnQS2DRByurPNr6vj/0aB
	 37DNzEHyEbvVpzm34seGCJiESvBlG5o0xjP/k0EV9WwzQCUYssPzd4uo4Hj9dewCbm
	 LZrb385bG2vFYQGFmZxljKrKBxFCznEo4bCCH3T7Fsa1pBc+D6+fKbHWLZPzpYaF75
	 OKBUz7WapFMrtuJqkZzC3EzMQGiGds6vkozCptg7uUUMO1hRebRkXgaL+o6YX88MON
	 ZHuaYQ7DSiMCw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Thu, 15 Jun 2023 10:23:01 +0200
Message-Id: <168681736632.249392.2955088102759301523.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515151049.2797105-1-Frank.Li@nxp.com>
References: <20230515151049.2797105-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 May 2023 11:10:49 -0400, Frank Li wrote:
> Layerscape has PME interrupt, which can be used as linkup notifier.
> Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
> when linkup detected.
> 
> 

Applied to controller/endpoint, thanks!

[1/1] PCI: layerscape: Add the endpoint linkup notifier support
      https://git.kernel.org/pci/pci/c/71d9ca28015c

Thanks,
Lorenzo
