Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344721;
	b=kQ8TcpgKGD+lZz/Rv+EkAmluZ9cXnR7iumVDfNNFQv4BcRdPEl+3VYztJXCbekxvWBGw
	 /WWHybgi1QCSJbE+gv2+OBOOSraebxwCV4z2RwT6o9BCLdVr4pvUm8SnHPVXFP1CUklBo
	 JQ8U+vADqFUPGDSFDFajH0NwDllCPaioMVNxC0v8fGFvONRwRxNhJUMW3CRrv7EbXAa0q
	 N6q+2cL332yesgHjjsyuJTnCjocdmC/qY/2Mbh6zfoD/9E42PWLyEVjP6mih1XalRcMsw
	 5QoYHlTndzeCwvteCn0S3jnBX/R8WC0ngzEDx2zRKWGMFifyvi2UVubIgS8WeRGAYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
	b=4cO2MdAGyniAGoU8Y/ECJHMn+g+jrDDABP0gV6SxrXNwaqh+9Rv/nvtYc4vE5vICAaRk
	 J7j+MikTW2VuOGsxCT7h78a2fH0FffsxQujunI4niWpR8AW0oTfcAun7H3J/YP8yDh8+R
	 7GNQbyjWekjdlwbensK/hixwET8SugId1TlvLoHNyjpF+PZ8/CvPkJAkhM17wnyzYPCkQ
	 AUoxn/omtWkKNp6f+UfdlqTxRVjrZvdatLRxBOq/KeL3uytPdqTyNQGWSlr9RV31UL6sw
	 OdSxxDfKPywu/CxZPWWW975I2r/CfxHVa4acIMqDPbM3RekfENt41I/FyJqvQxiM53A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZqhDMb+U;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59273606A325
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 21:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59273606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZqhDMb+U
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6fe4372c5f3so1399767eaf.3
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794344719; x=1794949519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=ZqhDMb+UTaaiDz6TYX4chkVfcif8myViDK1aM23IIDpDmdUE4ggRQVAwbkYO54tuDu
         xoWbcy6txBDkoMqujorhr5MDPr6QLvooBVBip5qpXiLhoQVsbC5f2G4GeixU2tWnRaYx
         5vzZwUAr4AOIDEk7z8G3GydA8ZKuQ4Inwl6pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344719; x=1794949519;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=ZOafhtsU4cpzUS2PRG71OpatuBC2rJgMxnkddteL70gZw9NU9dfI1CDUj0vYeN8w+A
         xBcPEC+WRQAxd7JSmUqa9/oSPoUrnVEDMEfYcH6wAmMEnuArBiF+SKuCTpSzCRvDzgUR
         ZgcyO8cJpe5pHKQ7NESlEj900ijTdqMssBzBw0z22ZhOheytJZG7UrV2uSsyskn6Gxfu
         hWEEkLd461P41MU3jKEyT1ITOdZF6mfJhb8RzetKI4RXmuoTZaioML7hfbmRHOh68eBM
         4MeS2DZuNCwlL/9iqrq62V/f7yIC0Uq8VAcgOK4LRwRSOwuNOMBo6sF7dytqh5uAJjKn
         /ohQ==
X-Forwarded-Encrypted: i=1; AL+hErH2a8KVosMH9KsQaD0sMA7LKFs9SziNpfXfxV5phF9YJlR+X4j+7E/J6urrAVDht/slmnE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8N2KyqloLvqbYpxmIo1vBmue2q1IH+iZhMxNTWEgKGWsy+pXnC
	9WJ/ksZExyh6dt1AnY8aIHBgEDp2P8k8bMRr5EZlLN86u3FXFQ/Rx8F7he68rib4DQ==
X-Gm-Gg: AYBFou2um5MIbXVoG4QM/9XBImgTbuhxuv/03kf/N/e0Dj3NSuidP+vuwmpNNlTmivL
	U12wHMWr1n3Igb2za4H8wNGKJ5YGIty2sbBl3HqzXnEChpPlGT9uh/TUqpJfqGauCp0hSlA9Ar/
	kKBtyss3J/wQul5UhZWZHoBIi7+SgoHxO04Y3cI+BLH20CjKY6wJa9iRNvYcXOm82f8Cf92WO2l
	+XN2ZU50NjKE2StzbYduxoNw17kH3zXMVz+WBhHI4IGCtP0HFThV6ij9E4Ii4SG/MulxaBiIeEU
	fNa4kxQWnIkwYT8HrUZ7XhHGYOO5bEMuOStV9tMLj0rUDQPP6fkO06TRNE5mqMv9AkxFHl6XjrL
	bWMXUUJaKN8YtOPmL2nMwVJ5YT1PTIs0D4IBiGY0N01E+TPn0cH314x+8UGrE/dXGRZnOodnfv4
	vqFa3R9zYDA3EbjlFMMZ+pYnirNgzp6iofRFxJ89FNM/dP9/AamroBxmkmKfArqVY55LF5LX/e6
	Io5emkEWjNcLbX9ZzSY0d3746Ii+3juDlg+VWs3/QrNenI07ThtisLTGS1CxT1TacjQ+Y68JMTp
	/a+PR7jLwxYFqk3JiD5GCqN/y3tjcL6NkI5USUEYdlW/Degiocj1IeksRphrjzmRTXx4VCfCYq9
	USJ3p0vpTrjPJMRvrWrg2GxXXc4a6Jll67K79Tw==
X-Received: by 2002:a05:6820:c44a:20b0:6d9:979e:22ad with SMTP id 006d021491bc7-71917934e44mr119108eaf.54.1794344719257;
        Tue, 10 Nov 2026 13:05:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (57.128.170.34.bc.googleusercontent.com. [34.170.128.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb62443sm2856553a34.6.2026.11.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:17 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v11 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Tue, 10 Nov 2026 14:05:14 -0700
Message-ID: <20261110210514.1091741-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com> <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 09, 2026 at 09:00:22PM -0700, James Hilliard wrote:
> After one second of unsuccessful pause retries, stop the transfer with
> dmaengine_terminate_sync() outside the port lock. An indefinite wait could
> otherwise leave a request/response peer waiting for data that is stuck in
> a partial DMA buffer. Report that recovery discards the pending payload:
> without a stable residue it cannot safely be copied. Keep rx_running,
> rx_pause_pending and rx_terminating set until termination has stopped DMA
> and drained its callbacks. Then restore receive handling and allow another
> DMA descriptor, without latching a permanent PIO fallback for a pause
> timeout. This trades the stalled transfer's data for continued reception.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
