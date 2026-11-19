Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110066;
	b=Q3ierON38tvvYvu5jhJS9eMW+H+8vnd6jJeO0ZmTN59T5dNq+dtaiMAXyAtO3eQrBR1E
	 Y0qW0NEPpuuetYorqvrBHbkxIWLtiPLt7jHMvFr5/bRpkJ+swmD4wMlB1irB95kT5eF1Y
	 /Kmufk6D3+uZgautEGq5n50xnFEORISWJqwsv2I9HGQP9XEo5lfxsUeuODpXmtJ02nHaT
	 K+uPUsuvANneuGkyduNBsdBYWdVubZRflhHuBium4sCKGjxVB9xObrh8ML/OrJLBsv+xx
	 yvQR0Q/jsS9B/OF3N3zbTgWg9hvsTSWr8gQRV92VgfqqIiBS22ZcOb0cUBsCTeHFexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110066;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=3VTybhTqKJAZ/JbIkL/pP1pBqKL4V+l0hnFbRL9gv40=;
	b=KBHJiVwFb3uDxazX3jbLfwblCRuORrJwCy+2aBDHy/Bbe+d62Jl+Z3Wb9hC80BQXvFCC
	 ftq88omQJRVM7Rir7Cp/xRoyqk+3StZIC69vex3wI+jo47W4Xm33ifaAXlYLlkcO3/5AG
	 LmWagXVkQVztuM+nbXsFTjbT3woy7kASjQjmuxF2hsI6PkxlDFuKpnzMz8uNfToJ64RFt
	 kf0Urd9oUDjpHTbyzNgJJkTNK82aVjq/WkeHp9dCE8Kw6x3qczOVg1WXcC82uPcoA5p8C
	 zLmEyLLfR925eBHRLmOQFCl0IF0Y4HiUwnxGadVUFCuaHBiBRR+NcjWQ+NIdDxaldEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfdmdYmQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13269606A320;
	Thu, 19 Nov 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfdmdYmQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B3C1F000C4;
	Thu, 19 Nov 2026 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110065;
	bh=3VTybhTqKJAZ/JbIkL/pP1pBqKL4V+l0hnFbRL9gv40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TfdmdYmQS+qILgO5gTXBo2Qngno5vhyr+SgEOhdjYJN6HMwP/fF+LBN8U/nfpJlMe
	 rlkIyXifWTW4bW3n5J5KHhCsqx6eNrU4T5A7IMGf9wxbMfZh2+XmcLInWvZmHCpNtL
	 os2fqO9lA1y/MYnAM9/j/HJB9Xv7aPjBxJRPRKkK442SsKGl4jeNxhDbH5IBF+eBOP
	 MRVgDpluMZnTDA6VwKfJbdbWrLWScJ1THF11nWwJQjKk7xNCX7YjiC2/q/ZCcJxv8a
	 XdGPXWlIWtpsCvRkrBqOaxctkZqPOlkbg4ligJykmWsOUlCWbc9Jxg+Q5iyVNKZ14X
	 ScUUmI5nlerUQ==
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, mfd@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
References: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
Subject: Re: (subset) [PATCH v2 1/1] mfd: stm32-timers: Use
 dmaengine_desc_set_callback()
Message-Id: <179511006340.87394.11961349474529132483.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:41:03 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 13 Nov 2026 12:57:12 -0500, Frank.Li@oss.nxp.com wrote:
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with a call to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Applied, thanks!

[1/1] mfd: stm32-timers: Use dmaengine_desc_set_callback()
      commit: 20288e5e843ec16a9dfd9e6449f2f635dfc654ed

--
Lee Jones [李琼斯]

