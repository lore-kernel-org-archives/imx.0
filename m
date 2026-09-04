Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542683ACF1E
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 03:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491038; cv=pass; b=QIs1MOquI8vA4rS0WBq3+ZmjrNIXaJOIo+zIN05dzbHqs70HlfGluEfL75Uwer5SlNAo6dHmoL2J85UGmdaw90vmZNcA4dihqKH3cswoIV8zVe0pvUP3atX8y4nGbz6AS6MBH823eHrMEVrXns61Srz/uAPXz0n/VSDD6GVMqYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491038; c=relaxed/simple;
	bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QK0EbIIa/r3HHF8MrCABKNcmh2NtJ8KDUsLo0IuSle92oqL3GHi/i0+3zve72SeP95QsL5gwBtwXyidOsC4+NqOIe17j5Q5tt5X4AgCryaxYduqNbgoadEmzpLJpONrQGQmHHFA4RYvKbh2qXKXfSE+vxjwGG8fXY/6xallIlmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWPBeItI; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWPBeItI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84830c774a0so559366b3a.1
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 20:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491037; cv=none;
        d=google.com; s=arc-20260327;
        b=B8QlZI1HHzEEmKj1/0w0ea5dOJ8rLMN0lcjKBGI2UoEJjl9mVSGeQ8qX8D2j9NujmB
         zd9jjzC5lK4zRGVMVUNe9LwEn+S6Nvubs/AYK6IWxtz5uGlopxhQrFC5rA2OHxXCug8r
         PKhnf2YBFJk3NJ2aJ1HlQ7LPHr9zsWajWoyvHOqXb/Mm3dLl10/9LrfFXhGNlrBxXJeM
         7o7ZqrbUs4hLGxvfJjPr21HSFez5VWvrl0B8rkYRNwBWuAnH2mO28VpRFE+s5oNjiJLy
         4qe32NK53ki7oFaU9WVChpCCqJZTFEcbsJVG8G8SaH2xkJGdMBouprY9hyDYjXQY1Tnu
         9I6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        fh=1JPfMs5hBKip7cd2+P8M3TNnKtf7T0q0osQn/1yQ6Cw=;
        b=cWKIOTNkfwd6ncAa3kLB9UXYpy25VNkqLIbx7AxtAUNX6SxnLMzHNY75SSsYP25/U8
         T4Al3jjb1EFlB4ktthbY2kXqZ5kWRjtpb9+E1Q44m/HYyuyXzA9HOdHEtrkhXz3C+cbE
         kKyfdM4e0Qe3pVcwFajPXJktMHlnkH1SNNdmLCz7WGBkYCxYsqttEKZhbh1NAwVbdAkA
         kTLBVzk1oK0RPzXOt7hZscf/Ck27fgxhqlG+LO/US3OoRhc6Wh8XKNzosoPMborJXG9q
         iWOIbrmVNjIHcs+b++bjngVN60cZr6HgbmkMf3lNQwXj6MCSLTgd1teaoazfBhdM1KxN
         u+JQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491037; x=1789095837; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        b=oWPBeItI0xDt0pleXWEeWRBWG6fZ7PfXCMX9dhbPdNbdAt0IRXa6toaNQwFWgxBj2Q
         PUY644EPg9lv+m7GWzVGQp79FfK1uuopQxm9pjCN3d/17fTxZUPfgXMQu2DaxcUcSee7
         lNEOApC/lvCmVRCiLlZSeMHaO3WrT+KnMkNHPnTq9jmuz4fZB9Eci58FxJDzcPK05Oc+
         Na2hX05jOhCCHcc2eiUERTp3sN9E2ig9KyIwPjcH7ssAhFZGNCXPbBQ07RIx2e3fBHDL
         JY74nlrVdQstSk42nQJYoJAGTVAgDlVSZxqCIWsLcGtZhol7AhQ3dKBQvomaZh4N3XMu
         6deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491037; x=1789095837;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z2doF7EPWFGqoPz03TF8aMEAMJft9M8wIvsJEX1Rz0s=;
        b=tSXss75POYIEbnBEStEO2ZYbUmhGPMUft4xO/HKRkrQLDLheSuT30ra7HN8kWUiObv
         ckOG8ft8Xt2H54Y+7nxFjPnjFYL9e3bC4P2zpZyeaOlMR0YT2bVhALtlZvbpxjpe4nCL
         olEcq0HLyS6aq5IrCbIy/AE8mmBBEofm4Gtc9WX9dgzCn9WoyprI0CZ5piYVf+duALyi
         7DhlkkVV/r+Xh0tu/a8qpkGvgMhk0kgFy9zi23kiuJIqqYKXoB+5h5E/EUzgN2EW5UdQ
         aVRZOpGbL/L0JhhqRP9B5+SOXZv5iVGRhojSbRWdfp1glKhctKTSYiSIZKKpAgoyRru8
         g8dA==
X-Forwarded-Encrypted: i=1; AKwUvByd6Nl+GJfuJoWCqA+Yj28qpoqbt3kKyrBhBngNDXxWTyivouR/nKC+QYcsBfQ4U9rNJZE=@lists.linux.dev
X-Gm-Message-State: AFuF++nEW5U4fup3a2NQqwqI+1JzfEjKvHv2ceKlkBQx9ZzKoSTYXh0Y
	ijXgOL3h1aWESk3Pl8HzgfOUAo4MQdUr/OJ0dXlG5O8NfDFsHuAdvL3zPHgTb7ISHsSBj0bHEG0
	U40ORwes3fUpqpjTZODszITQAkeWEXC0=
X-Gm-Gg: AYBFou1ENSDYrE08949LpxNjWAAxbhW+IvRTt9CTUTMWkExl40ULuZkowsOHdA9ZiIH
	d6Z1sB/6VEafFdePEW//EcZYNnXV9oH9vYj3tua+ZwNEujJ6FLC9WJ+f7jPluyuA5bUopg1/Iv+
	hR++RttAu763XzvApWuPyx/tigsx4O88xCm9+SJRC00KzSoI3MRQ5pWPeS+bTrGIylTWNVnEF/L
	OsjPV1St+PYHmSDkZpN5mRkK2Rq1gknnPueyVo63jwfu39QlNHOWG/dp5MAbsT93pATHcDcgedE
	tYF4vitcJYu/zUCsjy4UhdUUW9cVBuWGlu9qjJQnZ2mRnvO4ygUnlXzeQsTM6nK3T/R0FwfWrTF
	9HDVrGKJS/XkBqzMh+zSY2fApW/5B9F3k17fIFE3+CJVaONDnmZ28gj44
X-Received: by 2002:a05:6a00:2c94:b0:857:727c:a1f2 with SMTP id
 d2e1a72fcca58-8616907f6e9mr4805768b3a.20.1788491034969; Thu, 03 Sep 2026
 20:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com> <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 10:03:42 +0700
X-Gm-Features: AcwNN1WpmhDLd9SGZogKk2zYLLCenPMMN1VDDLJIPFCLsNZLZHavDM4ZfmsEdqA
Message-ID: <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> Is this a real bug that bothers people? or just an improvement?
> For real bug, I think the patch should target to net tree.
>

I consider this a real bug rather than just an improvement, for two reasons.

First, commit b86bcb299092 was a bug fix and was also backported to stable.
This patch fixes the error handling in that change, which incorrectly
treats errors
other than -ENXIO as an absent optional IRQ. Therefore, I believe this
fix is also
relevant to stable kernels.

Second, the current implementation can silently ignore -EPROBE_DEFER and
continue probing instead of deferring. On an affected platform, this
can result in
the PPS IRQ not being set up, causing the corresponding PPS functionality to be
unavailable to the user.

I don't have hardware to reproduce this specific case, so the issue
was found by
code inspection rather than a user report.
If you think this fix is appropriate for the net tree, I'm happy to
retarget and resend it there.

Best regards,
Phuc
