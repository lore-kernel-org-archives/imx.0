Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD841CCAA
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 05:14:32 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5231410ab27so3328237a12.0
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691817271; x=1692422071;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojr7wZNPMNIDfDBoR8V4Es1RD8j2xiDzAX3g/Pp/Hj8=;
        b=hduJ2HRhBj56b2gLGXDGSgbETWapWPKjLm/s+YfGbvPZT97C2HHA0mpUMs1NMR1/F4
         QfJFREICSgS/5zpZ0oDXIKF5jzm+TKRELPB/3AMSrFTCAk0n5IakuDTeZgZ3KnH0CKhL
         YtdtpeBGWgy+VxfeSsQCW8q1ugS5UkmWxtoBxtsmKtBXeUvYxLWInlJptR9tdu0HA8ep
         7+W/APCE3fEIxlfjpjGhBbiOpdZvqHBukWfWm6K2ou0j+ZLXyIAmFyLhrJWel3x4RyFo
         kezxXFs5gEEi8hPfiggfbED5OyUeGNjthy0timrN3vsLE5X6dKLMjv8+Ui8tiIQlhYNS
         xO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691817271; x=1692422071;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojr7wZNPMNIDfDBoR8V4Es1RD8j2xiDzAX3g/Pp/Hj8=;
        b=b2+4Z6TkLyf8fK7IkZPTWUDmmHUAivaw/JZEFrQAHNAsUbRY4uJo53jbhbAm+DPdtE
         MNq1ffFpJ/i/KnmPAbnWsvydoRhSYNoMxhfof8mRpNLPU3p2AfWsqEevg4WwQNxFUnYz
         p/LCWVaj+ovp/6ZfXuPJO7mR5MVMMYpfEN4LHeXJSdaOxRJDvHBjIg+TiZRJRe0rg0ax
         Rlo4lRtV1gXMQ5J8p6plCo/CK81cwA3XrTThnIhkKd9E2+tWGorkdXUvm0n4Z4Keb+PT
         Db10MGui7IFpe4U0yAGvFSOyppl0gso7VqrU2sMgdQkGwSp6g1hoG4IWXFNIhANDgUYg
         C8xQ==
X-Gm-Message-State: AOJu0Yz0RHhCRHqLehK98dUiV/W9a9CW2HW9Srn/2FEvbYZNPnMVlGMp
	0eSVa832oSByrlJxVNQn4750IQBcpL4LYCsei7jNDeQ+XZ8=
X-Google-Smtp-Source: AGHT+IE4aWEMNDi4Iouw7yZJ/4w+B92y7XIt30r0JIJxlzRjsIpz4UdsDGH/vbpH31Typepb4iou16ckJFD+o9pP8dQ=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:1216:b0:523:41e1:705e with SMTP id
 c22-20020a056402121600b0052341e1705emr2808402edw.21.1691817271036; Fri, 11
 Aug 2023 22:14:31 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 22:14:30 -0700
In-Reply-To: <CAC5d1W+=DxsHcGsPQ5NjKHbTWGgNnQuyQkj23imyz3dyMe6gYQ@mail.gmail.com>
References: <CAC5d1W+=DxsHcGsPQ5NjKHbTWGgNnQuyQkj23imyz3dyMe6gYQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 22:14:30 -0700
Message-ID: <CAC5d1WLL_VyOrZE=nhyTAfbncFKHncgAywa-QQs+n6n873hKmA@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Testing dynamic buttons again.

Test
