Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641521;
	b=boGvjJOKDDLSCoDUwWwSvfPda6xyLHKIVswiPKY50yEonCvg0ZMoWUGECxfHPDX2hWam
	 2XyCJy3K4Hl4Y8ANZUGgklDXEUTDwL2ZN94HuIJl8LV8EiipMTOAOPIUfhkGV+8RIHXhq
	 KDcT1x5ienTFpENyQkQ7/zCqWQdt5o1nWoclg7XKQuQaTLPwa3hQdYmVpgEeXNA3JxjfD
	 wllWF2s16GbjvMgFcrgyIPBPfqueclAqdzt9GFpjL2UCtXFetP32PVVm9/57f2nS4NRAX
	 oHJzNOvPuAHJqgUDlNO18RpMnACVcHTWS1atHUM6ukNCNhmF5bXa/uWQeotrt7CIkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cu9PaWVFQMOInDGv9IVEjFH/4qnlcu0Bz6OCDQsjVAI=;
	b=39xQ9+5VvzZ2Ccg1q12dwBdHTnAKLE9lwK9ksT4GPDaklY35SOBlVceoyJpZX1bfZvvI
	 41WblbUnHzyY5fRf8N/HmbmcYZHtqJI8VGdHagYkeGUhVtIqgwUm5cj1Xz/BR2cQrT3Zh
	 eYUfFkTsn81Sbnjvu++U4ilASa1AkL575EgUpZk/4MmvNpEA6taA69UHe4DryYTVVqZRz
	 3Nk36E8ysqNhRLKO7UOy0jWpkBzLz/m8b4DXDmqFyvi4rSDB+ZRG7mmfGEwdg5MTauNzn
	 w3aGxcntQMTbfQQDsCH+MEeNdxaC15noBkHlaagLX8VZ2cXE47zbGq+IaSXDCLrkdow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOtzOV1H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7679606E03F;
	Mon,  2 Nov 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOtzOV1H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669901F00A1D;
	Mon,  2 Nov 2026 17:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641520;
	bh=Cu9PaWVFQMOInDGv9IVEjFH/4qnlcu0Bz6OCDQsjVAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOtzOV1H116aEYF7pIUiLqu5iHaHrmQTaUadFovpF/rzX5UBBVKEyunx3wHIMZywI
	 yG04RrYJ1MCb7RQFGtrzYBGdNgw8u/TjhBuY+GWipmZM1velc28X4Ixgj62QMSdnQw
	 g1aIR28fhbyzk+/qCnGTZdgGrx79QFLXIb1uN4rL/ylfaRwQLc0p9fUHH+Llw/XH02
	 iU1WzCotBoaQEnE3IINOSrkziNqwLq6MctuonnEVPA0UBMkKdYuWZcuUw1X2x78pss
	 WceOdimukBJkVVKGM94LYKDOzvRnZS87buYzDr2Eq6r+rh6fky3jHOPCTerjJgUYSF
	 Nxlg1avNweOAw==
Message-ID: <sashiko-outbox-193858@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OkZSRUVTQ0FMRSBEU1BJIERS?=
 =?utf-8?b?SVZFUg==?= <imx@lists.linux.dev>, =?utf-8?b?b3BlbiBsaXN0OkFS?=
 =?utf-8?b?TS9BbGx3aW5uZXIgc3VuWGkgU29DIHN1cHBvcnQ=?= <linux-sunxi@lists.linux.dev>
Cc: Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:45:19 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] spi: rspi: missed desc_tx->callback conversion in rspi_dma_transfer=
()
--

commit fc7630df2ca55b14f36e688b27950bd8acaa67b6
Author: Frank Li <Frank.Li@nxp.com>

spi: use dmaengine_desc_set_callback()

This commit replaces open-coded assignments to the callback and
callback_param fields of struct dma_async_tx_descriptor with calls to
dmaengine_desc_set_callback() across SPI bus drivers in preparation for
making struct dma_async_tx_descriptor private to the DMA engine.

> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index c61edd1c1353b..5e03a186e9e79 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c

[ ... ]

> @@ -577,8 +576,7 @@ static int rspi_dma_transfer(struct rspi_data *rspi, =
struct sg_table *tx,
>  			/* No callback */
>  			desc_tx->callback =3D NULL;
>  		} else {
> -			desc_tx->callback =3D rspi_dma_complete;
> -			desc_tx->callback_param =3D rspi;
> +			dmaengine_desc_set_callback(desc_tx, rspi_dma_complete, NULL, rspi);
>  		}

[Severity: Low]
In rspi_dma_transfer(), when both tx and rx scatter-gather tables are
present, the if (rx) branch right above the converted else branch still
directly assigns desc_tx->callback =3D NULL.

Should that branch also use dmaengine_desc_set_callback(desc_tx, NULL,
NULL, NULL) so that drivers/spi/spi-rspi.c does not fail to build when
struct dma_async_tx_descriptor is made private to the DMA engine?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102174005.3933=
649-1-Frank.Li@oss.nxp.com?part=3D1
