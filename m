Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC76A57
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 16:27:33 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52557cc5e7bso2397487a12.0
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692462451; x=1693067251;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xwC7jemqORzt1WFKrCTHJ0ysYtXQXxi+cYzO49nCvyc=;
        b=Pxb48/0E4wpV1Lg2ytOq7bfJshNE8RnuEuc6OsthtixeLbsjrvHnkspUg6uW4q1iDv
         Y4Yrm12410JQ1BCvSrJZ1QnJD22IzhT9MMfCeVv2A8JAPip1X9NNZdHFbgv6LpLsjyYn
         tb2HQLgrTCQQA0ZxddBbvSzUFUx+N23mOS9RGZb3B+T/FdberbElzceQal5y3Xg3Wnyl
         MQKckp4orzncbJI/PVvnDc25+Zvi+8VC0eKsEvW6L6MYrC6TunsCdcMlTTnCALxqn6Y1
         lIZOjjFgHh6elB3j4ihGpF5Kp96e4BJcgLiDmQwkZNdojj4TD8wGup2GM3lPVMURrfYz
         sgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692462451; x=1693067251;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwC7jemqORzt1WFKrCTHJ0ysYtXQXxi+cYzO49nCvyc=;
        b=a11y6m186ovHSwiX+7MsJtuzTIkGtyfCGF1x6GNQ3yWmZGS/KsTOl+D3VwFaWZQwYS
         /J3HnydYq7i/mbR6aVUM3fsOYPxdF29U1c/1SnzQ8qI3IKf8F7LybnQiyASLlCSmz1d7
         rpHjYH0rjIFG4WRm2U9mXarYh6NQ7JNqxu57aNz1QvwBgaSfDO+ippHFsmhFS6AHJ4Ii
         1WdpxX4KCpNfw6pKS1ik5dW6MIJm89d7G3UUEZFW1IsfRDooyMEJOkdcK8xLnSUccJDY
         vj34HoUJh5fnDsX8v/n38GAZU+xmzf4gO/X2cRrHHdEBTp7ON+haPUKAHBDi3rhjEKT+
         ckEw==
X-Gm-Message-State: AOJu0Yz6rOGL9eTyLG99tzOm+9Y+68ckMXm5l43h72PCiIye+gKqLPHU
	WMItWb2amLgPoJneKoSNiuwY4wKyGITR3K5x38TidLZCEzc=
X-Google-Smtp-Source: AGHT+IFnaw+QBXN/BCozCirHQuckqO1AWje0l4dNqfe3qebr54LlhntUv9xPqSRX6kUUnuQ+aBYH5igeXshzMFqScdY=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:c508:0:b0:522:2f8c:8953 with SMTP id
 o8-20020aa7c508000000b005222f8c8953mr1606790edq.39.1692462451576; Sat, 19 Aug
 2023 09:27:31 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 09:27:31 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 09:27:31 -0700
Message-ID: <CAC5d1WJUauztAuihxwzX6H3RfrgELoLYjQbg29fJJChOwGBXwQ@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing api

type response

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
