Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A514F7B
	for <imx@lists.linux.dev>; Thu, 17 Aug 2023 17:36:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so52351a12.0
        for <imx@lists.linux.dev>; Thu, 17 Aug 2023 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692293816; x=1692898616;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb+/346dtpITXDlsh/+lDhXLtFyfStishbYpZCOpk4Y=;
        b=misr1gCloXflNHHE39z/OQIfrJcpwpLtICLaIsOUOinmMHgD06qUg6ccou5X5SPqzC
         505QD15Q0UW797/K+MH7zABvDdtTbkgYDr3IYDTMwVUvFtZyfufXP8NBqFHZfVsxPV/8
         NV79VFsD2trcYbIyiQfr2y/it+FsiGZMtHWZqSKf7g92ALcOvkuUqw6aEUZlN9sLiA1N
         OqzN3U6Yf+mVfym5JLkMF36o4f7PIYtJmef1HczKlRWRJOJGQJtD3N7nCXhbO4gBNrU/
         jMqwZx6RYFMj3dIJG7RBFtB+SjYuGcXCdj9Add71yoY+aMKj0bC0FF8GQeZIUF9C8Vvy
         WuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692293816; x=1692898616;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vb+/346dtpITXDlsh/+lDhXLtFyfStishbYpZCOpk4Y=;
        b=djpQ2b5lcPR+OcgJORfoIh7qKv5F62W9lf4Iw8tlPPCdWZqXeBazRz0y+1WVEkqZju
         Eq/t06qNKh8zftfXopQeQTGBREdmn7DIWOxPsKRnVxqONqOJ5HYRoLX3tx9BXH/gjX9d
         PFAMcF9Nbli+Jv1jVQv6uICjtBS9ux9xzz8lffhIEu/gBWphqXfnMixOUZN9nKXHtEPI
         dpr0ry2T8CWhBMvzfzwhWkaZAYopmIzSNUL2IFm5BughNXmOQCpR27eDHk9Y/xviN7Oq
         Dq9lavvee9sAeQHoKoeHzWpuTCcnmkB8oejj5kqkI4AJUwdQrSG9//mkGg3kqKINqNMa
         Exow==
X-Gm-Message-State: AOJu0YxDWKWsOaPhCTIoQpB3LfPgbd9bNz6gazPOz8tbo1Pjkoqo5fQG
	Geku2CHybYBFXHZGLiCZdAuXu2MrlO1LpC+PJhw=
X-Google-Smtp-Source: AGHT+IENxE1F34xhmY/VQKpOFQ/52sNhk1azg886B6OQv6i4GsymAfxP+eHDIuWz1TXGhiPNL4nfq/5JDl/K3HFh8B8=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:b35:b0:522:3a89:a79d with SMTP id
 bo21-20020a0564020b3500b005223a89a79dmr326054edb.2.1692293816219; Thu, 17 Aug
 2023 10:36:56 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Aug 2023 10:36:55 -0700
In-Reply-To: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
References: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Thu, 17 Aug 2023 10:36:55 -0700
Message-ID: <CAC5d1WLrThbisd8+8TgYcC6TVdeYey7f5dQtha0YWKDeoxkB7A@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

test options loading.

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
