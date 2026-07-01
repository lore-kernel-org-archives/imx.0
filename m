Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6A404BF3
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902237; cv=none; b=WMLDErIPv3wzYSkxaWGl+1Ri+kpaciLtN6knnKNMb60QYA0n/MkBTrnrFZc5DRkWXARbb7jNtEMLDM4BR1aInm/hauNb/0FYA8bFKhRUXkqgLW0BEm5PcCgzTqWJS+U8vaOBiFleY2hFDgfL8h32Uubwa9e5LlasVgMgppUDJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902237; c=relaxed/simple;
	bh=y9sLn/8h42OZAovx8ZSCMJKzKeoA9vzessZn5NM7R5Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=tKrc/Q7Tdfvowq/vpqExvbNUunYfIce8SQQY0khZg5K2J0psv+mdxP9yDrlxFl9/+7OK9UGRBw2TYXquoczPSieBhDdclHD7A3OEKA0gcvUWV/7XgBsMU7tX29D8Nwgoy0Yfw2gc9TCwzAoIb8tTNkSCc/F+veAVrqk2523Vg1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H6BB8HfV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H6BB8HfV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so308957f8f.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902234; x=1783507034; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJZJ10VTyXhL1d9Ttz8i+zfdNsrSf2HhHlmTFaNeGOc=;
        b=H6BB8HfV7k6gDooFSPv/NmkVc5HOu8hEwfMwSofYcRu/t8xcpaDCifN1MWuDRJzhp3
         zU5zPZAnlnBDid0mnp6YaD22rL0jtEnaGkZVBgbWAL7wP7s7DzUtWY/CA9hM3QbSklC1
         /dkL1OlRa0KSvMqrqwtiD5gmEl3b30Cf1JGMb1bRW8EaKCLolwE5aOwfsS15Jgq3N/1h
         WpnRO6dBBjqWmNCNP6eRStgI3Gvn3vItixGxfmaPfarDT5ecBl2t3AwVM2OYGwKbr3dZ
         EkcOZ6YV+yBdJTkebKvjJEdeBXKUN/0YhbheOBKLQX0hKTI57gBZXUU4lhKnN/uCjYnp
         smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902234; x=1783507034;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJZJ10VTyXhL1d9Ttz8i+zfdNsrSf2HhHlmTFaNeGOc=;
        b=LNDEvhxnnndJKQsz0JVXM2XzEk+fKmdymn1RIOafh4GHXlZSyXDsaQ2kPUK2xRJKAB
         AS6QqHjKGNAuSzR6AERvouxIlFi0tjGYKxiyFoRtF5MNA/koHbKhL/fWTt36BHMQXUmF
         IE5PFRwfxc/Orn8cD5gOS7cpf6yrSN3ldwucjshxVe1MmQjLUqSCf61dmNGE+Luh7Ek9
         XephkhXVy6Jh1oCRCh1Ab1Q2cQ1dNPVUrvpRT+jalj3ec4AXFlPwtWS/8sOlGQbh7Noj
         DFl0QPvUQpdg7zFsIgcllEyyQvVLVglcmrHmqErE4cYZ0XBvu4eLMzWNooNoW7XXH5UN
         JNAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLW3NiI5IUb5g64LzGzCpMSHJDFGTFsiR4uYDN/CeTZjo9IXhGiCVDk4iJQVWwenCqrdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFx9qWlrerNTO9cRv1NbMrrF11Zco7xNTIKTLrTUqXahWBA+jA
	F3ZTK6csALAfdPejzBewY6CkTM/tRFC8J3+CZJtwQleFU1tLrsI/15jy3guWIfO3Av0q4ZnXy4J
	7Te52PmA=
X-Gm-Gg: AfdE7cktx1oYWU1h2UV7OQuDIhdkPWLWPiMiTgknMouiBJXJrni31dbwCn+rM4AHP0L
	hS7SIphViDlE3TKF1GlA2Y2PGppiwlW905zZL8+BQxUjsnptxKwrrEvMkAatdt/qHopakFvTlAX
	hDtJJuFBy5sg++xSQzxBBV/n9TEyZWoxbOPijOIZ8yQ12EKBrC+03PD46K0k62vJYxq5eo53NFb
	TFJ5tFsRE63tip2mE46Y6lvZ0k2ksiDgdgb4+KTaSPU68Cf9rh8A0VkYtTVD5URkuqNPcQGwTd0
	+70YOt30L4d5pSBa0oVcVGEvUvItgrCz9JE1LKdelS9KnHLPagRWQDqRFEPbJeUbiRupAZVrcjE
	kOYcLKqNeKtVeXX0a9p9tNxdmHOexwOHTVDqTJ985XG1gfuQW/Q49hHo7eSt719ObS6KlReDKtg
	RZLloUzOc8Ta58ZLAPdWdDmPC9cC36IaWDxeJvLMxdr8EGnbhndkVV
X-Received: by 2002:a05:6000:186f:b0:475:cd6f:720a with SMTP id ffacd0b85a97d-477571cb959mr1787276f8f.1.1782902233176;
        Wed, 01 Jul 2026 03:37:13 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Jorge Marques <jorge.marques@analog.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222674.176638.15906284505119583670.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=y9sLn/8h42OZAovx8ZSCMJKzKeoA9vzessZn5NM7R5Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3W6RSUBwcwXd/RyICidNxc/zyGOAtYZuRyl
 Jsj9dvEae+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 RdLnD/0UpCa/Q2wq8xsbII/YaP0tNZvNatp03fchDuKWWea8QwXe4UgAYdPUJzOEXalslJ+gz2T
 xpK6CSQpwG0n4IVyfWbC5dHltlVJuN0jlXQ2+EEMB7WxEABr/6tjEAgnz68RT4+ql6Wp7EA+x1I
 zupfBdmaY6w+HeU2L7gUDYhlCAHyPrzDsimOa9gtU3lCxGHMJGCbYLWEA/kHZ8PfqTQX5yeqkHD
 5WF69+VTf9xhaG9V4MN8c9efCN40CbR4/Ed7yLJrvDm/HwypMkGHEH9teOjuYkUxumxzZ7RjTzZ
 92pfbXQLs4u0q2F7/K2VObkGp4HH40MOjDFWuaOeJOrXm6MnIgD8xzW0bMyL1q9uYylEE58XV/j
 xxqbfI9zYJXQmIfnTdt1VTU2oGc8ezPAw28FHw3dxqcv3nPb1hQFRKIuCZDdZi+ZQ3CNw86A9YK
 eLjzg3B3X/rR3dOrv9qLZBH2v1tIHkZCCOYb356m/S5aiY1x2DukKk5BIpGNWNmIqGWZ4x07urC
 KsNz8b0WWLn7gub/jYg+HGajgAqMDYKc7USKG/bbHS39pvVD2ocrYVjoHTptjFYzD6bjpGXFowF
 CF3LmjPogUsr9von4hwTxXm9gcMAYLn5RQ0oUkYx3KAgAyf21vFnifOIaqImi5UswX5GSajCeTa
 VfmY+utVzZ8xj7g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 30 Jun 2026 06:20:25 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index a7593d6efac5..4a984a5be264 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>  
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> +	cmd = &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len = cmd->rx_len;

In v3 this assignment lived in dw_i3c_ccc_get(); in v4 it has moved into
dw_i3c_ccc_set(), the write (SET) path. GET CCCs are dispatched to
dw_i3c_ccc_get() (dw_i3c_master_send_ccc_cmd() calls dw_i3c_ccc_get()
when ccc->rnw is set), so as it stands actual_len is only written for
writes - where cmd->rx_len is the count of un-sent bytes, normally 0 -
and stays 0 for the GET CCCs this commit targets (patch 2 later moves it
back into dw_i3c_ccc_get()). Was there a reason for moving it in v4?
As-is it reads like a regression; keeping it in dw_i3c_ccc_get() would
make the patch match its title and work on its own.

-- 
Alexandre Mergnat <amergnat@baylibre.com>
