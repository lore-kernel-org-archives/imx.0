Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA263AB
	for <imx@lists.linux.dev>; Tue, 26 Sep 2023 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C1EY996H2+nH9kVv7VeJU7gdej000u01sa7M392CTh8=; b=GgDOX9CWEbDc4YMM/aQ26SsUk2
	b9PNZ3qRQ6wNjEp8D24yZ6pSz/DQ5m1/YwEnvv/vklPcFF5gm0sMGut4fYDXCa853VmHgFPt2DDsI
	Gyc7MZtPtTnNdZYMJoJ/J0l4z9YT8UojXVzWfacia1N+QBRRUcrzKF/d9LD+Kl0yiAQoSgXgVqWU1
	Xvocw4+WXqLTIH8G9ThPqN+WWHPYGyfTe0RRIAp7d6WbjXXqN9BISlhYc5K3Yt00i0/yOOkaj06ii
	YkyyObq/BrQCFSHSN4HbNzEfnoXd8Xaza4pACStfXRAxPAEcvrAWy95GTZ3Gw7wo9RsnXSw7DKlY0
	8woO0Dcg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2Tk-00FnKk-0i;
	Tue, 26 Sep 2023 07:27:32 +0000
Date: Tue, 26 Sep 2023 00:27:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: christophe.jaillet@wanadoo.fr, bhelgaas@google.com, hch@infradead.org,
	imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v2 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZRKH5CTucrT5BFwC@infradead.org>
References: <20230922042836.3311689-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922042836.3311689-1-Frank.Li@nxp.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

> +	/* set 64-bit DMA mask and coherent DMA mask */
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));

The comment is a bit silly :)

> +	if (ret)
> +		return ret;

Also no need to check the return value when setting a 64-bit mask,
but I guess it desn't hurt here.

