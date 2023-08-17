Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B512B97
	for <imx@lists.linux.dev>; Thu, 17 Aug 2023 20:21:32 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so486015a12.0
        for <imx@lists.linux.dev>; Thu, 17 Aug 2023 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692303691; x=1692908491;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knypU3KG9xu1zWx/kLopCCq/2rIudqFAyj0mT4KJo/A=;
        b=aMsYP8d5IncXERS/cs7EcEN643jl5USbWBPGjL8atlCNTRAzDNX5VC6uEKOYXpHY/r
         kDeUDTKWJ/WvkOKQKco+U0iLZvVa4fOoSqewWh0aPhxZnTCTwYSptJkA9JiUgw4BXKVN
         DWCs9+7r8BcROp7HUItc5ey3yd87OwmjfnZipEOT3T0YZmqDFUoSknet4uSfg+uN/fur
         1iH5AZEp2GBFp/aocbFLfr2AgRs9bihrir4ONg4GvF1NY++TG5dYIYz5QuHLdqEZE9h4
         uUKKJMiNLUIpnv/qBeBh1cWrmPsupskRtvk1G3YsitOdqchJGqBHWErnGtUHAONx7cj1
         WT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692303691; x=1692908491;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knypU3KG9xu1zWx/kLopCCq/2rIudqFAyj0mT4KJo/A=;
        b=PS8ul/5huzhcbyaZ8JXFzXA6SvgMIyTMGbQ8DCUFm5PJ3fr9+LSs2Q0fhRBUPEe4EH
         +b25dz56/NhV0anp1OUMnm9QKJQhnDgkcdYwLnwnrDL2r5avVorlnLTqSbSDkcKeB7z8
         9Ij4njf05/6nw0SCAlpKPvlg8ylPxUxx8vle7eQ8bJ/OY0NxNNr2Y3MdhGUuR0SHjLMy
         qbRQX/vf0Jz23ejO8XQm4C9s28hnPRqD6DMuZmYvCnR6iJAlwLSWHMBchV7sI8GnjBb4
         Pi0DlJt5ICgVbbJlictLq7ENlB+amJv81fAFpabZEKPw/8F81LlziAhr7zGjegwPn3KZ
         QYcw==
X-Gm-Message-State: AOJu0Ywamox78i/+o+AtnWHSJLiNHv3bhLBMz1M7WTXsxEsKmDLEp4AU
	gQcPc1+vTNu7JP/9+SY551F+046tjc/kxxB86zg=
X-Google-Smtp-Source: AGHT+IEOkYEHCKnTCFTD6AmLfv/H9mUNE5Uq+wy88EOtfY3dibJYDnQ4KCV2syEsFH1JzRlZY/lEUVxFeSfiaSRmwDs=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:d88f:0:b0:525:6abd:2755 with SMTP id
 u15-20020aa7d88f000000b005256abd2755mr475028edq.16.1692303690604; Thu, 17 Aug
 2023 13:21:30 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Aug 2023 13:21:30 -0700
In-Reply-To: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
References: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Thu, 17 Aug 2023 13:21:30 -0700
Message-ID: <CAC5d1WJgx99d3uRZmsnNoAewXWu6FeOS8FUmUV6V0KFEi_zp+Q@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > > > > Browser extension test thread for quick email replies.
> >
> >
> > > > > > Please Ignore.


Packaging check

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
