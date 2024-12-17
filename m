Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227C1E573F
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432315; cv=none; b=WWGS+PmRaZpmgvQRWjEo10FkZrXzeyegCyO66ugfoKmZ1+KxLm3fygqegWuXb0LcPPLJhdwDBJS3Xy/3DCoWdxJEjYeySipSRMIxnHcQV1SEZkSeNZZYXkZhqGY1ji2+pIMFiaC9xAwPmSN4F7FiRnXrJLm9v7i2IDHfYzyoWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432315; c=relaxed/simple;
	bh=DoiNDXeSYmuPiZtQYI5FjMp6WgqD6Jy3rx/jNzYzoH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhek62/inSbNdp/81DtC6dIV2hUuEFo8VL0BxvVRhDoWYDGgsADRQ/I3YzWF661RkO2sJDl4e7bAfYyNbvCQnHjBstqrFu6SrPkUnjlAPH2zncarDbdSgkZyOENHod3mBwIOkAlEPAAtMtvGwfWkQNt7x0jLrwG3v1MesXJCi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ak8pZnGh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ak8pZnGh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso799287866b.1
        for <imx@lists.linux.dev>; Tue, 17 Dec 2024 02:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432312; x=1735037112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcRctnbApoihRzPdFWaVbg0Lu0K88Zf+TpJvmNIby8Y=;
        b=Ak8pZnGh6squKiNolRXOri/b5JR95mHI4kbBUTf17U2GCTPRKZd+3nrt4CyyIJXaod
         2LNL5nE633LsZFMNH9H4YSZLAGSdOHelum7NYtFF3XB77IAPQhcIPQtzJbPP6BHC6BP1
         6kM6CYqNORjXGy5tvjWqUUY1rybgIGy2Shp9Kx5grVAAYXilciLZJXBcdhOCG++bR+5X
         J20/WaxObsxFfetJ8x0AslEnnRLbIq/nmOiqrtkWCPvp1Nb4WEkuH75QeHxOP6PxMJRt
         PONSWAaKrsLNlBDdfbHt6H8Yy+bK4adC4EcB1y1CB0ArpnXrj5tALRaeGIHfuSKoDyIs
         xM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432312; x=1735037112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcRctnbApoihRzPdFWaVbg0Lu0K88Zf+TpJvmNIby8Y=;
        b=sSqDrn8rrqK79EkituL09rB52+xh8DFq2VYiKTSCzfIMYCWZNwMsWkndDSSgcN9F1z
         Y6TZiue3DA3qEfmKnhZ9u3LvahsUoz2HqLgnuTlFSwb+wuhUPOm+DjKUbGrn3h5BB5nC
         X6Qz1w0Xik405PIqp6L5wtyVB/94jxAgzPDrNJnD3Ibv6StdpNZTKBDzXaix0FQIWgmU
         LPxcB9t9lTU0caEnBFZM9BDY65dZMJNYF1toM4aRe2pIfew5yLYlhdTw1iV9oIeA9llc
         O2A8Lnv/LdEHc45kXDCR2Ob039SkHGcPbTqkgTIK3o6Xj8Bp9Y3WxdSva6oDCUM7hQy4
         Wwtw==
X-Forwarded-Encrypted: i=1; AJvYcCVsJgjYT149PGzsc0evjV6578lPuMD1xztZKuBygL8g3df1VDL6EU9Ea+HAPHev5ZW9E2k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmkz9W5zJZua2TzUTJ95vjtb59yid+vqV77f0CQvTs0cxaGIIk
	kmIp81hcOxy7NZ0Zhn6iLwdalLQ82NybcnWUN0lOIyUOPzXxKRpHxG7twxxR2Zk=
X-Gm-Gg: ASbGncvXSe5vKQagV+QliWGbSJF3H3bmpAiImSRxetxUwb8AImZMq9SGHUGOhqS3pZa
	1J4V6YnVAf5vDqx6u4Rr0krG7KPl298KdsZGMl029MgMBxWgzg1PGk9DgyfpikQia6mTgb1XXGw
	IDFVbb4+dnCXRWxN5VQ0lol5I/78Hmt3+Cal9AQ1LjrbWMlTWYt/op9wLVGQpFElL7ngQ6U2Apf
	p/7TV80dKYi6pZrv7UbM7rIs0XyIKj3KuDQLXxFpsrjo5WbLo+Kn26Pub9V6A==
X-Google-Smtp-Source: AGHT+IE33WJtppU7GWo4C9n0KIsjxGKWo9PfZfBga/d9h0pMjOZyyKuoihkIkBrSXWmOKYr+32gMhg==
X-Received: by 2002:a17:907:7d90:b0:aa6:7d82:5414 with SMTP id a640c23a62f3a-aab779b04edmr1665157266b.30.1734432312202;
        Tue, 17 Dec 2024 02:45:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b267dsm427913866b.179.2024.12.17.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:45:11 -0800 (PST)
Date: Tue, 17 Dec 2024 13:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <0e46eee3-332e-4fbf-b6a8-9e645750ecea@stanley.mountain>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091208.2416971-2-xu.yang_2@nxp.com>

On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> With edge irq support, the ALERT event may be missed currently. The reason
> is that ALERT_MASK register is written before devm_request_threaded_irq().
> If ALERT event happens in this time gap, it will be missed and ALERT line
> will not recover to high level. However, we don't meet this issue with
> level irq. To avoid the issue, this will set ALERT_MASK register after
> devm_request_threaded_irq() return.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")

I agree with Francesco that this was introduced by patch 1 so the
patches need to be folded together into one patch.  The commit
message would be something like:

    The ordering of setting up the IRQs is not correct here.
    We need to call tcpci_register_port() devm_request_threaded_irq().
    Otherwise if we recieve an IRQ before tcpci_register_port() has
    completed it leads to a NULL dereference in tcpci_irq() because
    tcpci->regmap and other pointers are NULL.

    However, moving tcpci_register_port() earlier creates a problem
    of its own because there is a potential that tcpci_init() will be
    called before devm_request_threaded_irq().  The tcpci_init()
    writes the ALERT_MASK to the hardware to tell it to start
    generating interrupts but we're not ready to deal with them yet.

    Move the ALERT_MASK stuff until after the call to
    devm_request_threaded_irq() has finished.

Something like that.

regards,
dan carpenter

