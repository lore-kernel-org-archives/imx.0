Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E205524F
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110017; cv=none; b=QTnS2iNv0bAJV9tswGY6X/AqLSPmOkzhfmxnXN+pXPE6eERiwKfhEnDWIQC1jnqyWcBaJ7Bwc8Rqv4MktlSMeXFXVLWVibnugVY19a7mxNPb4jZ3C8CNK8dW+e04hOk0TEv49T1PDtefUf6jZxgMCtMu4zNnSjoMA8QUzIZjLdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110017; c=relaxed/simple;
	bh=FvhXiPh2zeXzTeRJgyzV63N2jWYC9mSuDAQuNFB7lW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAuuv8PBfUjxS4qqUe16xAzSJwhMqGc86V7AkUKHMVTAR99YpUi45vSX28uOIAvvOs6CRTNnbjgNi2HSqU4j4CmYjlXvJugYO+zbxqnmbe2fw3sfFRZheisEguetOqyOe3WAvft1Dh4d04w3RVmDnPBN0vYITo+VTn1til/pXlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S6PTxzUl; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S6PTxzUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ogS1093DYNfHdi/kXr74mgK5XoOfm1WU8YZW02sTJ/g=;
	b=S6PTxzUldpxTJgqdY3tBVH3woW5ltXkGSXvaDpCR1zSzSgFyEObaWTUzIDStB6
	MQjNk3RabBxi3NB0W8jiXjdGkI7R6daAklbDxuZojA8kBMdQ/5wPsaY47jZtw3yC
	n9r8tYz9IyoNB6Ix0Df81tvsCzDP6EujpicRJ5oAxwpoU=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHLzxuFNNm6Y47AA--.10675S3;
	Sat, 31 Aug 2024 21:02:40 +0800 (CST)
Date: Sat, 31 Aug 2024 21:02:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v5 0/4] Add dbi2 and atu for i.MX8M PCIe EP
Message-ID: <ZtMUbpBJscWlgkhW@dragon>
References: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
X-CM-TRANSID:Ms8vCgDHLzxuFNNm6Y47AA--.10675S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWfWF47Gw1kuF4xtr48tFb_yoW3XFbE9a
	yUJa4UWw45Ca10k3Wakrna9FW7A347AFW5ZryFgr93Xr4xXF95uFZ7t3s5Gw1Ut3ZIqF1q
	9F9rZa4UXw47WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZmRUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAVMZWbS+PA0YQAAsB

On Tue, Aug 13, 2024 at 03:42:19PM +0800, Richard Zhu wrote:
> v5 changes:
> - Correct subject prefix.
> 
> v4 changes:
> - Add Frank's reviewed tag, and re-format the commit message.
> 
> v3 changes:
> - Refine the commit descriptions.
> 
> v2 changes:
> Thanks for Conor's comments.
> - Place the new added properties at the end.
> 
> Ideally, dbi2 and atu base addresses should be fetched from DT.
> Add dbi2 and atu base addresses for i.MX8M PCIe EP here.
> 
> [PATCH v5 1/4] dt-bindings: imx6q-pcie: Add reg-name "dbi2" and "atu"
> [PATCH v5 2/4] arm64: dts: imx8mq: Add dbi2 and atu reg for i.MX8MQ
> [PATCH v5 3/4] arm64: dts: imx8mp: Add dbi2 and atu reg for i.MX8MP
> [PATCH v5 4/4] arm64: dts: imx8mm: Add dbi2 and atu reg for i.MX8MM

Applied 3 DTS patches, thanks!

