Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BB1C2BA
	for <imx@lists.linux.dev>; Wed, 27 Sep 2023 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=Wf8zy0/8iT0rNsNSC1VeuJ4umg
	ebHsQRABbh3cOEE+1j/XBhwX40QlWgpajv8a8oGauvy3tDtfFZg2MMl7A6tB5I4nr1fbnlJhUmSTJ
	rKPCmqd7bZJSpTVl+yi2IZL/1ljVYO3QfoWhsv2IfhYusoo+RaVID/kGiPN3fvT7yXkVGYEweLsg5
	hg7z5LNB8e5OOgqtzHfS/otTphNKn+aleFa8IPILIJq50pygLetHq4zrgxWVHF+dMhWbJS/7J0WN7
	LK+cEAd+RFtMiapT53GgTrQrJmLcgHOS4DLEKhVEQkh+etZuvEwzBuHKmFF9s1RmrQ7bk6/SX9vHm
	Cw1EFU6A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQom-000TDV-06;
	Wed, 27 Sep 2023 09:26:52 +0000
Date: Wed, 27 Sep 2023 02:26:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: hch@infradead.org, bhelgaas@google.com, christophe.jaillet@wanadoo.fr,
	imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZRP1XOzN7xtKR2Ao@infradead.org>
References: <20230926140445.3855365-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926140445.3855365-1-Frank.Li@nxp.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

