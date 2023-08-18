Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEB01BB2F
	for <imx@lists.linux.dev>; Fri, 18 Aug 2023 21:37:24 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so1752238a12.0
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692394642; x=1692999442;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/eA1IzL2EsH0K9GBQ5hyf9AXwI5rrZ+Pp1PPz/6OJc=;
        b=qU20LWqEWe3zhXHTyh3Jqwo3ED/WQaV2edOUb9wjit9+9JyIsZxyoZGAfTj4XMey1p
         kzSN/qvb75wNlsBEeKtzU6Gy5s0wdj8XULxfMDSsK6t2FGwhlsXegdtPkcZtdDPPArCR
         RV+SYKdMUTeaQwLWMWiL75wjv+VPPOAubLKIGEuSK0c5JKdcGTKbO2QGLHFmamfr+c6S
         nJAWX2697dL9x0YHclxFnaGEXuKSLG8Wq6kJjv6WLvBmKhoczhmFUegG6a0tg3nc2MOQ
         nq7/J+5V4Z27C4W5dppHrIHfDpb8fbTT5R3fYc6T1NUBwgK3NgAB98qKOXkH/rVA73yR
         LLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692394642; x=1692999442;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/eA1IzL2EsH0K9GBQ5hyf9AXwI5rrZ+Pp1PPz/6OJc=;
        b=F+1jI4irQLPc/WlCEpc66RbmmOWgjdFQu6YHLuuYtPwm3abQe8qb28mD0j3GaBZtBw
         x50e+HsxIzpmqMWT0dL8cgJTRJ/7Nn57x86aDA9YrAsJF8snPrMmxBrNSlV6D3Ihgnn+
         1Ha05eJRqcVPveFZl5/sIfrSYgrTtXiLGmeDISfJNGce5tgfjloW50jaByVJFnzCL9Y9
         yNL30CVDpzO1ebmnttzCRc7nqOWQC8c2GU1FDks2PMUVSvMGLvULO+JLBQxaplC9VPN+
         TSR1ZYU3I/pcxFAPuOQIlQDHTWjaeJzeEc04HQ6SRFAgMLLE8mXSNwR+7vxLIS9+/xr/
         TqOA==
X-Gm-Message-State: AOJu0YwprZiiEQJFKoe52OVTqG4IaF3PdIMMl9gpbtoLcsNkje704LbE
	GRMXvWzDsEby+oHuoxSR11Sm9TQCf2oM2MfXm/PrW02ulQw=
X-Google-Smtp-Source: AGHT+IFkiE22RYPydr88mku2tWNNbvB97WzT5o54nlTGNbAmr2AmGOmqDnH8J8pBt7vSz8Erb27FeT+f+7XlwkBrRQc=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:d390:0:b0:522:2aee:682c with SMTP id
 x16-20020aa7d390000000b005222aee682cmr287908edq.2.1692394641963; Fri, 18 Aug
 2023 14:37:21 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 14:37:21 -0700
In-Reply-To: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
References: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 18 Aug 2023 14:37:21 -0700
Message-ID: <CAC5d1W+6Woc4M457W_7hRYEKC4FiKZSVf1Cv17harMwMxeuOzg@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing refreshing access token

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
