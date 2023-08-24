Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DED524
	for <imx@lists.linux.dev>; Thu, 24 Aug 2023 09:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCD2C433C8;
	Thu, 24 Aug 2023 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692870662;
	bh=9Jx0lVj3qzfW3B1hjRBsqUAJlImDihTKFS0HifQopt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BeXEpdTAHbEmxGE0OInYqS1CXwTCazHHuBXAwLxH3Gj7/wm9Hkz82gJNsLsOJaFvB
	 DNsBUnNZ/0KRWGJ36+QwhQbKFhmSeAxp+GAVQridXrsUm+yZaEdTFcT/xWiK3esaI7
	 OMVdjII1Bb+5MJp1fW2S+RBDMVpvjWu26y6RPH23A1wQ716FJYh7stL0WrerCBd6z9
	 Yn3AezjFTXGkL6nkNnyHaOmXcVVDRDi6+x2U4P/owBr+5aLTVF6zqtmukrlTfZAwuD
	 52/qL2E6REVseu0TqD38R4ZjQEuiXlRLryH+wZlfbtecerP5qbXS2E4xeG0TznlbEC
	 vmQrAjomzX3Jw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: frank.li@nxp.com,
	Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	bhelgaas@google.com,
	devicetree@vger.kernel.org,
	gustavo.pimentel@synopsys.com,
	helgaas@kernel.org,
	imx@lists.linux.dev,
	kw@linux.com,
	leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mani@kernel.org,
	minghuan.lian@nxp.com,
	mingkai.hu@nxp.com,
	robh+dt@kernel.org,
	roy.zang@nxp.com,
	shawnguo@kernel.org,
	zhiqiang.hou@nxp.com
Subject: Re: [PATCH v12 0/3] dwc general suspend/resume functionality
Date: Thu, 24 Aug 2023 11:50:54 +0200
Message-Id: <169287064160.65192.2353415497041867559.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821184815.2167131-1-Frank.Li@nxp.com>
References: <20230821184815.2167131-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Aug 2023 14:48:12 -0400, Frank Li wrote:
> Change log
>  - Change from v11 to v12
>    Move exit_l2() to layerscape platform
> 
>  - Change from v10 to v11
>    Fixed two missed dev_err message change base on Mani's feedback
> 
> [...]

Applied to controller/dwc, thanks!

[1/3] PCI: Add macro PCIE_PME_TO_L2_TIMEOUT_US
      https://git.kernel.org/pci/pci/c/e78bd50b4078
[2/3] PCI: dwc: Implement general suspend/resume functionality for L2/L3 transitions
      https://git.kernel.org/pci/pci/c/4774faf854f5
[3/3] PCI: layerscape: Add power management support for ls1028a
      https://git.kernel.org/pci/pci/c/9fda4d09905d

Thanks,
Lorenzo
