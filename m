Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C12C9A
	for <imx@lists.linux.dev>; Fri, 17 Mar 2023 16:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B856C433EF;
	Fri, 17 Mar 2023 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679071093;
	bh=eqZUPeBX8BKdMjF5mwS63K8f+ED3apV6bCXS9iPYiZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tT2m/l/VZVW04GVsyt5LF3puq+zDlTtYsG+nbi0sgboS9phZAzuwK5Yllo5HjlUqR
	 fhrXMmSmXFZYNcnaJ9CHstgvjuyg0MthA4ejRXCllBXCKmiTpjM+cSQHLujbWJovpQ
	 PBnyIBbyTBxLjFVs6RMb8j6r6/3pM0dyFpeUr0+ApoITg7IIoK4daOS5e8rAO9/dLI
	 WS1pf7eYAfw0549GJa5H6E0+/9qbgh1pGjV+2Y8ARZABdijlHq0qRcQSxJ4p4NiQ+m
	 IUotYlMrhTKglYPy1bvLfGF3ppVkNGdigDOlopoEDjwYtpUrdA1idBW6JNLH1bAQLW
	 YXuju28VYx8NQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: helgaas@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	alok.a.tiwari@oracle.com,
	bhelgaas@google.com,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	minghuan.lian@nxp.com,
	mingkai.hu@nxp.com,
	robh@kernel.org,
	roy.zang@nxp.com
Subject: Re: [PATCH v3 1/1] PCI: layerscape: Add EP mode support for ls1028a
Date: Fri, 17 Mar 2023 17:38:05 +0100
Message-Id: <167907106433.509815.4523416530064745117.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230209151050.233973-1-Frank.Li@nxp.com>
References: <20230209151050.233973-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 09 Feb 2023 10:10:50 -0500, Frank Li wrote:
> Add PCIe EP mode support for ls1028a.
> 
> 

Applied to controller/layerscape, thanks!

[1/1] PCI: layerscape: Add EP mode support for ls1028a
      https://git.kernel.org/pci/pci/c/be567c6cbc08

Thanks,
Lorenzo
