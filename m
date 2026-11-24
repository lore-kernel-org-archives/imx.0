Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556876;
	b=2Hz+JWDckBQRDU1OJsTcUgL9V5wGJbJjVbyOcJA4KtfeA0AQJc032HXnZuFSKVZLE/zJ
	 7XKQgBtb9a47j6wFZ3psZaghGTlXHI4onBoNDTiyQrhXGyTNVDBjFctc6wtlL5Hh7LRtJ
	 qN2bwfYyXDxNZzyLqyp4COcsW8nr9frAn8xnv8g35s4RY8h2epa2WYkmqlqpDxWaIcVWv
	 BNbCiFMHBov8q6cG0oDMwKXKNx/Fvg0g6IvxHL7IM3pPMsuyNWEIOz9Jg+KhMxxebpEqA
	 m3C4v1Gu/96v8I1WGxKs/ZimoBTVj95OXqLhExNyt62pHzH4fP7EYErxwQMBhKgV1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556876;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=VgmBl3cMWjMJFWRHM+nTEfGdpFTQ3KfpZtxldlEuzDk=;
	b=BC/E78FCygvT+S4fbEOCwWu0Mwtz8oTTAaxswI8hLfZloiLWg+Y7CjHkXji0XcRndnVE
	 kyLRJssMEGri5dxQn7Zvl2MuAKyjFQC4alqxA6N//GfcaxuWUsZTgcxNfZlWO/09ZUu3p
	 jqeijtGfGx8IbyrX2pGyHIKV5QN0M4EtH5WaLMaIV1lm+Tli1M3YukVEAM9WTUY2qh8Qj
	 rYU+fOReEf3VV9qEjJeRnc67DevYErs4Lm8Tqd1p1XxghaE0wyuuaOUrQahHPCG5M7apb
	 SrxFvpu/p2IedG7mHY9bJHaM3uL5pzLk0riPPALqFHybS6XDTiLQqpjPZ0DEBcJAqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay3cscXB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF48606A323;
	Tue, 24 Nov 2026 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay3cscXB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE04F1F0093C;
	Tue, 24 Nov 2026 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795556875;
	bh=VgmBl3cMWjMJFWRHM+nTEfGdpFTQ3KfpZtxldlEuzDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ay3cscXBQIaTOwcIVHNR5L//j2Xi/2/5jt5IXgNX1iTb9XifIzb7n5q5uWcRyR0GP
	 6hhKh4bK3nLhN5rNtTQJcIhZ0mEa5WRC2vH2eSobs/uEoTrwEXhr0IL3uPU/logV4D
	 ylVRo/Hcd2/kvesulhFzPh+9n8CZz8pVv/ibFMuvHZu0i8IYPIySGi5662nUscZrzv
	 c1asp9oetiT3l440eCwHiyKPU1sVlV/LKl/J0u0lJjwXN4o6px9iX1p0DdhpoL/1i8
	 O0hq0JVFMKad01GCUl/1IeXGsT0921D1k1VDSXi9Nnu2gxzYQFW0lGzV1mLCtyyQWW
	 ynuvT5HiRSGgQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261102174818.3941639-1-Frank.Li@oss.nxp.com>
References: <20261102174818.3941639-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] slimbus: use dmaengine_desc_set_callback()
Message-Id: <179555687444.425767.12705906265515957664.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 21:47:54 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 12:48:17 -0500, Frank.Li@oss.nxp.com wrote:
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Applied, thanks!

[1/1] slimbus: use dmaengine_desc_set_callback()
      commit: c00a2b7fa897ad7bcadb7095780e9c2008e86851

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

