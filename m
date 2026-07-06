Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC3E3A8732
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352176; cv=none; b=O8rYxHEbhZL4349dDH1ypP6KGK1kiuXB+eAU5Ead3kIUTICpWRaDnMADbGHIPi5fp5dR+PQwwa6HykW3YKrxGFwg/xW1c1+MYvQGCUZ9MtEcIN+QzGfuUgCOrDj4SZMAvqIBKq3g8OPn5Pgk94h6psfIBR96iAqBIqcW6W9m/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352176; c=relaxed/simple;
	bh=yoUTKvuvvrI5QWkmLBTnhN5mNxnnhvrO9PQSrdo6b6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o0zk6UGh3VDgRYkgouCSW7bbtxbbr/LrcCrrdvNwvXU5VsMBlGe5gu7dr7ZZTgzyaxoSf5aiiTRk//12QByaa4b5bYq7xcQRkJopZ/vcHiY/0aoCNC8rp+ShShAEluQBi1PFZvoJ6KbQgkJOJdCZI7zj5WhkgUnUw2VPWZmlEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PHd5RgoH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PHd5RgoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
	b=PHd5RgoHBq7IFUQzH4mSAOJHSQm4/oS92wU+sf0hRTKH8b0dKwMX7ze/oz/1Cwn8Ef+/dh
	/9tvDAPJuMUJOHZ0JTfhiYqBqNAGvNXp6+h7qEoEEzbKUW4bhr3motoo7Xzi/w8A89eJ7k
	8nOvy1wghEqtEmSKYzOSHjxlMMIhUvk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-ejmTg9LEMquCkXLFFTwKZA-1; Mon, 06 Jul 2026 11:36:13 -0400
X-MC-Unique: ejmTg9LEMquCkXLFFTwKZA-1
X-Mimecast-MFC-AGG-ID: ejmTg9LEMquCkXLFFTwKZA_1783352172
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80d927cee77so52581457b3.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352172; x=1783956972;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9S6SOIwqotZVAJUl0A8DLIjddZv342ULSoUfACurNk=;
        b=fIdZv1Uav3nlAZk73EWIkh0rYHIPU9M+qCnoS8pnW5r5ELKRPE5o6yIF5FyaaUy1uo
         pRdnaA/41+wJYXlZxX9ocNnrXWA5aEbYnadp0pxTvauGBpVNM+BIVRZzKGvRNgd3KVpT
         ARVSV+bZbER01mujkEMC1LcF6v1CkWrTl0wVgkDLp3FoLau+8m5Zxl/rK/E/6+GjLj+d
         Z4eaU1InMOP3nJZzsy+gmkvNd1CNjIpUKzmHTfvJ8GoSUm+kmvsZCuHtGbYtM6f7j+r3
         LdYfnx1lQOkZ7opdwy7HQZWnCvPi/vR4CX/0DdsTG1DR/UZU844Uan71isc7rStGs3qA
         afFg==
X-Forwarded-Encrypted: i=1; AHgh+RotsKX27sQ/ElqfopUcx+WOYkvc5F7ZYKxlUgWFCyIc+nFm+I2216UxxEUITlLiUJ50J90=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYp84OSwDOa3TrZm6ulluKPv2wvznmYfaYTYB/uKXPGZJLhmFI
	LWWZ79IWHZGvUFIhZNYXi6VoJ+XndhrDetT8QlztZUFqGH2PRH4WNXVQo5LfeaKD/jbbRAlbvXt
	eQVRYwV37FdxPpeVPLvRnvoSAut9GzO/zOlGP7wryq6bIdf0l7panuQ==
X-Gm-Gg: AfdE7clwT1AAqjmZvN/CWtc2IksJ2nVJ07E6slIAYEJyWknMt2dzFqkY3x9mbpBWXAD
	RFnRnXAFu/8GnnPyimDUHW3f/gKVr0w6o5ZbUqNzZwl0J1WVy7qulUUo95HhfxojJqyBK6yE6OR
	y9CRiBM2qF1AuhyUB0d1C4xUmG+VbZNl2Zi+nxlpFK2aYd1gN4CAG1y6vB6B1wQ4UC1WSuVb7s+
	SKWAdbaTacATQfcjKHpXWSZMsPj0rGyryMdU0TmRZTdC4I52tqZw7nzLPlTzkMrwCq8V2Hi7jG6
	eJj7YENZEx5XrhQMc1w0PKhajmPT19RfzNktXieYvXuLNp5ESd8C7Y23gnOIlY8Fm7JPe9mJqne
	bChLW/0Yzs98b7XuewupYMAibeBQgUf7TdUm3WG5QwlLfQw==
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842507b3.44.1783352172223;
        Mon, 06 Jul 2026 08:36:12 -0700 (PDT)
X-Received: by 2002:a05:690c:670c:b0:7fd:825a:22d9 with SMTP id 00721157ae682-81be2774fd3mr6842227b3.44.1783352171750;
        Mon, 06 Jul 2026 08:36:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783cc5esm59746537b3.9.2026.07.06.08.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:10 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLaA8oZcKBRLZV@redhat.com>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bWcRRGcsmGNl6ozDZBYnYlcybcV2aBNAonn26SP5nxI_1783352172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 04, 2026 at 11:01:41PM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

