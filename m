Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75E347BC5;
	Tue, 18 Nov 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467935; cv=none; b=DrPYoQaj5MZ50w1woRVy7v7d9af0see6YygvVDO0cp4UY4QAIcnUBuMvfgy1RHazAAYSZ5BuMZmJWeHwksujzbl6Cga3G79uJbmgcExwSeTc0WMokdlAVV8roeqs7gfoK3w10H21GxC4KiT7hZsCjdtWZ9YkbE56wPpBlK2sKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467935; c=relaxed/simple;
	bh=PVNOdyEBoBQTC+IxG12BmkncjarDW/d2EWLYLFyGGGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=leOtraC/NZtlcQsPJ5ALjjph7TjgsJdiylbaXydpMAnbI4fTYqQzDrU/4nVTxdvLi7W38QXi7qHedI7OIRp/yDsYISk5PQ5EQJrsfkIQPLu0NEXauDFMR69bOwd1nZgkubwuk3PltL/UztmIvccIsJzuWL7kh4xfH2d5fAoZfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4jd2y0X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4jd2y0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97131C4AF0E;
	Tue, 18 Nov 2025 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763467934;
	bh=PVNOdyEBoBQTC+IxG12BmkncjarDW/d2EWLYLFyGGGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R4jd2y0X9Tf/r2CsubOz0PyKaFiwdynlTWSM4EwcASVqxSLHy/IFx0sYzkG5uLGat
	 NaWRlJ1Ii00hdl1eEHHCJrewqMJfD/odXVU+3oDc/WlQRzI5tm3YGhhyLV25kxVclB
	 ZWGLSHIcZUIsMP6lU8edW7YWeRukMjkcTVDNTPprA6eozH5odZqJ+CfGAQZ+POQJln
	 58qpTSOc6bXXgWT7evHoml4WC1guwskoNXJIrvh6b4beKbdNWSN+4uB3tsasoWjigc
	 lOWbVspZOcYc2VIkgxrYd7k9Zu80qXe2OY/GM5kp3wGZBuTwl9upUtgSiw2n/X3V7B
	 u8k2eTljDql0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Subject: Re: [PATCH v4 0/5] mtd: spi-nor: micron-st: few clean up for micron
 spi nor chip
In-Reply-To: <20251112-nor-v4-0-e4637be82a0a@nxp.com> (Haibo Chen's message of
	"Wed, 12 Nov 2025 19:05:08 +0800")
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
Date: Tue, 18 Nov 2025 13:12:10 +0100
Message-ID: <mafs0zf8j4k11.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 12 2025, Haibo Chen wrote:

> mt35xu02gcba, mt35xu01gbba and mt35xu512aba are similar, but with
> different number of dies. According to the datasheet:
> https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> these chips all support die erase command, but do not support chip
> erase. But accroding to test, mt35xu512aba support chip erase, do not
> support die erase. mt35xu01gbba do not support chip erase, but support
> die erase. 
> This patch set clean up the mt35xu512aba, and add mt35xu01gbba.
> since do not have mt35xu02gcba to do the test, just add some comment
> under mt35xu02gcba for further work.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next with the patch 5 touched up. See
https://git.kernel.org/mtd/c/7f77c561e2278. Thanks!

[...]

-- 
Regards,
Pratyush Yadav
